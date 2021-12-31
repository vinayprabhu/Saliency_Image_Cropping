import UIKit
import Vision

extension VNImageRequestHandler {
    /// Convenience initializer to create a request based on a UIImage
    convenience init?(uiImage: UIImage) {
        guard let cgImage = uiImage.cgImage else { return nil }
        let orientation = uiImage.cgImageOrientation
        
        self.init(cgImage: cgImage, orientation: orientation)
    }
}

extension VNRequest {
    /// Perform the request in the background and call the completion handler with the result.
    func queueFor(image: UIImage, completion: @escaping ([Any]?) -> ()) {
        DispatchQueue.global().async {
            if let handler = VNImageRequestHandler(uiImage: image) {
                do {
                    try handler.perform([self])
                } catch {
                    print("Error performing request: \(error.localizedDescription)")
                }
                completion(self.results)
            } else {
                return completion(nil)
            }
        }
    }
}

extension UIImage {
    enum SaliencyType {
        case objectnessBased, attentionBased
        
        var request: VNRequest {
            switch self {
            case .objectnessBased:
                return VNGenerateObjectnessBasedSaliencyImageRequest()
            case .attentionBased:
                return VNGenerateAttentionBasedSaliencyImageRequest()
            }
        }
    }

    func detectSalientRegions(prioritising saliencyType: SaliencyType = .attentionBased, completion: @escaping (VNSaliencyImageObservation?) -> ()) {

        let request = saliencyType.request
        #if targetEnvironment(simulator)
            request.usesCPUOnly = true
        #endif
        request.queueFor(image: self) { results in
            completion(results?.first as? VNSaliencyImageObservation)
        }
    }

    func cropped(with saliencyObservation: VNSaliencyImageObservation?, to size: CGSize? = nil) -> UIImage? {

        guard let saliencyMap = saliencyObservation,
            let salientObjects = saliencyMap.salientObjects else { 
                return nil
        }
        
        // merge all detected salient objects into one big rectangle of the overarching 'salient region'
        let salientRect = salientObjects.reduce(into: CGRect.zero) { 
            rect, object in 
            rect = rect.union(object.boundingBox)  
        }
        let normalizedSalientRect = VNImageRectForNormalizedRect(salientRect, Int(self.width), Int(self.height))
        print(normalizedSalientRect)
        
        var finalImage: UIImage?
        
        // transform normalized salient rect based on larger or smaller than desired size
        if let desiredSize = size {
            if self.width < desiredSize.width || self.height < desiredSize.height {
                return nil
            }
            
            let scaleFactor = desiredSize.scaleFactor(to: normalizedSalientRect.size)
            
            // crop to the interesting bit
            finalImage = self.cropped(to: normalizedSalientRect)
    
            // scale the image so that as much of the interesting bit as
            // possible can be kept within desiredSize
            finalImage = finalImage?.scaled(by: -scaleFactor)

            // crop to the final desiredSize aspectRatio
            finalImage = finalImage?.cropped(to: desiredSize)
        } else {
            finalImage = self.cropped(to: normalizedSalientRect)
        }
        
        return finalImage
    }
}

// Test out with the image

let saliencyTestImage = UIImage(named: "EiT2SftUMAEjDRH.jpeg")!
let thumbnailSize = CGSize(width: 410, height: 2600)

var attentionCrop: UIImage?
var objectsCrop: UIImage?

saliencyTestImage.detectSalientRegions(prioritising: .attentionBased) {
    result in

    guard let result = result else {
        print("The entire image was found equally interesting!")
        return
    }

    drawSaliencyRegions(observation: result, image: saliencyTestImage)
    drawSaliencyHeatmap(observation: result, image: saliencyTestImage)

    attentionCrop = saliencyTestImage.cropped(with: result, to: thumbnailSize)

    print("Image was \(saliencyTestImage.width) * \(saliencyTestImage.height), now \(attentionCrop?.width ?? 0) * \(attentionCrop?.height ?? 0).")
}

saliencyTestImage.detectSalientRegions(prioritising: .objectnessBased) { result in
    if result == nil { 
        print("The entire image was found equally interesting")
    }

    drawSaliencyRegions(observation: result, image: saliencyTestImage)
    drawSaliencyHeatmap(observation: result, image: saliencyTestImage)

    objectsCrop = saliencyTestImage.cropped(with: result, to: thumbnailSize)

    print("Image was \(saliencyTestImage.width) * \(saliencyTestImage.height), now \(objectsCrop?.width ?? 0) * \(objectsCrop?.height ?? 0).")
}

import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true
try! FileManager.default.createDirectory(at: playgroundSharedDataDirectory, withIntermediateDirectories: true)

func processURL(url: URL, fileHandle: FileHandle, completion: (() -> Void)? = nil) {
    guard let data = try? Data(contentsOf: url),
          let saliencyTestImage = UIImage(data: data) else {
        completion?()
        return
    }
    let filename = url.isFileURL ? url.path : url.absoluteString
    print("Parsed \(filename): \(saliencyTestImage.width)x\(saliencyTestImage.height)")
    saliencyTestImage.detectSalientRegions(prioritising: .attentionBased) {
        result in

        defer { completion?() }

        // drawSaliencyRegions(observation: result, image: saliencyTestImage)
        drawSaliencyHeatmap(observation: result, image: saliencyTestImage)

        var line = filename

        guard let objects = result?.salientObjects else {
            line += ",no salient objects found\n"
            fileHandle.write(line.data(using: .utf8)!)
            return
        }

        for object in objects {
            line += ",\(object.confidence)"
            let normalizedSalientRect = VNImageRectForNormalizedRect(object.boundingBox, Int(saliencyTestImage.width), Int(saliencyTestImage.height))
            line += ",\(normalizedSalientRect.minX),\(normalizedSalientRect.minY),\(normalizedSalientRect.maxX),\(normalizedSalientRect.maxY)"
        }
        print(line)

        let array = convertToMatrixFrom(pixelBuffer: result!.pixelBuffer)
        line += ",\"\(array)\"\n"

        if let data = line.data(using: .utf8) {
            fileHandle.write(data)
            fileHandle.synchronizeFile()
        }
    }
}

// Grab an image and processing it.
func processOne(url: URL, outputFilename: String, completion: @escaping () -> Void) throws {
    let testFileUrl = playgroundSharedDataDirectory.appendingPathComponent(outputFilename)
    print("Writing to output csv: \(testFileUrl.path)")
    try Data().write(to: testFileUrl)
    let fileHandle = try! FileHandle(forWritingTo: testFileUrl)
    processURL(url: url, fileHandle: fileHandle) {
        fileHandle.closeFile()
        completion()
    }
}

func processCsv(url: URL, outputFilename: String, completion: @escaping () -> Void) throws {

    // Create output file.
    let testFileUrl = playgroundSharedDataDirectory.appendingPathComponent(outputFilename)
    print("Writing to output csv: \(testFileUrl.path)")
    try Data().write(to: testFileUrl)
    let fileHandle = try! FileHandle(forWritingTo: testFileUrl)

    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let data = data else { return }
        guard let content = String(data: data, encoding: .utf8) else { return }
        let lines = content.split(whereSeparator: \.isNewline)
        let group = DispatchGroup()
        for fragment in lines {
            let line = String(fragment)
            let elements = line.split(separator: ",")
            for element in elements {
                guard element.starts(with: "https://") else { continue }
                guard let url = URL(string: String(element)) else { continue }
                group.enter()
                processURL(url: url, fileHandle: fileHandle, completion: {
                    group.leave()
                })
            }
        }
        group.notify(queue: .main) {
            fileHandle.closeFile()
            completion()
        }
    }

    task.resume()
}

func process(directoryURL: URL, outputFilename: String, completion: @escaping () -> Void) throws {
    let testFileUrl = playgroundSharedDataDirectory.appendingPathComponent(outputFilename)
    print("Writing to output csv: \(testFileUrl.path)")
    try Data().write(to: testFileUrl)
    let fileHandle = try! FileHandle(forWritingTo: testFileUrl)

    if let directoryEnumerator = FileManager.default.enumerator(atPath: directoryURL.path) {
        let group = DispatchGroup()
        directoryEnumerator.forEach { e in
            guard let path = e as? String else { return }
            guard path.hasSuffix(".png") else { return }
            let url = URL(fileURLWithPath: path, relativeTo: directoryURL)
            group.enter()
            processURL(url: url, fileHandle: fileHandle) {
                group.leave()
            }
        }
    } else {
        fileHandle.closeFile()
        completion()
    }
}

try? processOne(url: URL(string: "https://pbs.twimg.com/media/EiT2SftUMAEjDRH?format=jpg&name=4096x4096")!, outputFilename: "test_saliency.csv") {

    // Process all the images in url_all.csv
    try? processCsv(url: Bundle.main.url(forResource: "url_all", withExtension: "csv")!, outputFilename: "apple_saliency_all.csv") {

        // Process all the images in dir_raw_images playground directory
        let directoryURL = playgroundSharedDataDirectory.appendingPathComponent("dir_raw_images")
        print("Processing images in \(directoryURL.path)")
        try? process(directoryURL: directoryURL, outputFilename: "apple_saliency_local.csv") {
            print("done!")
        }
    }
}
