---
title: Dataset description
layout: template
filename: data_descr
--- 

# Dataset-1: The Male-Gaze-Like (MGL) experiments spanning 336 images from Flickr


```python
import pandas as pd
df_mgl=pd.read_csv('df_mgl_336.csv')
print(df_mgl.shape)
df_mgl.head(4)
```

    (336, 29)
    




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>file_url</th>
      <th>file_name</th>
      <th>album</th>
      <th>width_image</th>
      <th>height_image</th>
      <th>size_image</th>
      <th>width_round</th>
      <th>height_round</th>
      <th>sal_x_twitter</th>
      <th>sal_y_twitter</th>
      <th>...</th>
      <th>crop_height_google</th>
      <th>confidence_apple</th>
      <th>sal_x_apple</th>
      <th>sal_y_apple</th>
      <th>top_left_x_apple</th>
      <th>top_left_y_apple</th>
      <th>crop_width_apple</th>
      <th>crop_height_apple</th>
      <th>saliency_map_apple</th>
      <th>mgl</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>https://live.staticflickr.com/8576/15678067187...</td>
      <td>15678067187_5df9778ea6_o_d.jpg</td>
      <td>ama_14</td>
      <td>1000.0</td>
      <td>1500.0</td>
      <td>(1000, 1500)</td>
      <td>1000</td>
      <td>1500</td>
      <td>862.0</td>
      <td>1162.0</td>
      <td>...</td>
      <td>562</td>
      <td>0.535154</td>
      <td>463.0</td>
      <td>253.0</td>
      <td>185.0</td>
      <td>190.0</td>
      <td>814.0</td>
      <td>1308.0</td>
      <td>[0.0416734, 0.02431909, 0.026942655, 0.0137556...</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>https://live.staticflickr.com/7486/15863195222...</td>
      <td>15863195222_319e1e6588_o_d.jpg</td>
      <td>ama_14</td>
      <td>1000.0</td>
      <td>1500.0</td>
      <td>(1000, 1500)</td>
      <td>1000</td>
      <td>1500</td>
      <td>412.0</td>
      <td>187.0</td>
      <td>...</td>
      <td>562</td>
      <td>0.545259</td>
      <td>448.0</td>
      <td>165.0</td>
      <td>261.0</td>
      <td>362.0</td>
      <td>430.0</td>
      <td>1135.0</td>
      <td>[0.070013456, 0.05282114, 0.045947406, 0.04006...</td>
      <td>0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>https://live.staticflickr.com/7483/15863847385...</td>
      <td>15863847385_e81fa7dd70_o_d.jpg</td>
      <td>ama_14</td>
      <td>1000.0</td>
      <td>1500.0</td>
      <td>(1000, 1500)</td>
      <td>1000</td>
      <td>1500</td>
      <td>487.0</td>
      <td>412.0</td>
      <td>...</td>
      <td>562</td>
      <td>0.545817</td>
      <td>433.0</td>
      <td>341.0</td>
      <td>0.0</td>
      <td>262.0</td>
      <td>718.0</td>
      <td>1236.0</td>
      <td>[0.06788689, 0.05252986, 0.049423505, 0.047421...</td>
      <td>0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>https://live.staticflickr.com/7513/15678085497...</td>
      <td>15678085497_942f92cbcb_o_d.jpg</td>
      <td>ama_14</td>
      <td>1000.0</td>
      <td>1500.0</td>
      <td>(1000, 1500)</td>
      <td>1000</td>
      <td>1500</td>
      <td>562.0</td>
      <td>412.0</td>
      <td>...</td>
      <td>562</td>
      <td>0.554018</td>
      <td>536.0</td>
      <td>341.0</td>
      <td>36.0</td>
      <td>424.0</td>
      <td>964.0</td>
      <td>1076.0</td>
      <td>[0.06382404, 0.04812908, 0.04656945, 0.0477425...</td>
      <td>0</td>
    </tr>
  </tbody>
</table>
<p>4 rows × 29 columns</p>
</div>



The descriptions of each of these 29 columns are as captured in ```col_descriptions_mgl_336.csv```


```python
descr_mgl=pd.read_csv('col_descriptions_mgl_336.csv')
descr_mgl
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>column_name</th>
      <th>column_explanation</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>file_url</td>
      <td>Download URL</td>
    </tr>
    <tr>
      <th>1</th>
      <td>file_name</td>
      <td>Name of the file</td>
    </tr>
    <tr>
      <th>2</th>
      <td>album</td>
      <td>Name of the Flickr album Ex: espy_17</td>
    </tr>
    <tr>
      <th>3</th>
      <td>width_image</td>
      <td>Width of the raw image</td>
    </tr>
    <tr>
      <th>4</th>
      <td>height_image</td>
      <td>Height of the raw image</td>
    </tr>
    <tr>
      <th>5</th>
      <td>size_image</td>
      <td>Order pair of (width and height)</td>
    </tr>
    <tr>
      <th>6</th>
      <td>width_round</td>
      <td>Width rounded to the nearest multiple of 250</td>
    </tr>
    <tr>
      <th>7</th>
      <td>height_round</td>
      <td>Height rounded to the nearest multiple of 250</td>
    </tr>
    <tr>
      <th>8</th>
      <td>sal_x_twitter</td>
      <td>abscissa (x-coordinate) of the most salient po...</td>
    </tr>
    <tr>
      <th>9</th>
      <td>sal_y_twitter</td>
      <td>ordinate (y-coordinate) of the most salient po...</td>
    </tr>
    <tr>
      <th>10</th>
      <td>top_left_x_twitter</td>
      <td>x-coordinate of the top-left crop-box accordin...</td>
    </tr>
    <tr>
      <th>11</th>
      <td>top_left_y_twitter</td>
      <td>y-coordinate of the top-left crop-box accordin...</td>
    </tr>
    <tr>
      <th>12</th>
      <td>crop_width_twitter</td>
      <td>width of the crop-box according to Twitter-SIC</td>
    </tr>
    <tr>
      <th>13</th>
      <td>crop_height_twitter</td>
      <td>height of the crop-box according to Twitter-SIC</td>
    </tr>
    <tr>
      <th>14</th>
      <td>confidence_google</td>
      <td>The confidence score associated with the salie...</td>
    </tr>
    <tr>
      <th>15</th>
      <td>importance_fraction_google</td>
      <td>The importance fraction of the salient region ...</td>
    </tr>
    <tr>
      <th>16</th>
      <td>top_left_x_google</td>
      <td>abscissa (x-coordinate) of the top-left crop-b...</td>
    </tr>
    <tr>
      <th>17</th>
      <td>top_left_y_google</td>
      <td>ordinate (y-coordinate) of the top-left crop-b...</td>
    </tr>
    <tr>
      <th>18</th>
      <td>crop_width_google</td>
      <td>width of the crop-box according to Google-SIC</td>
    </tr>
    <tr>
      <th>19</th>
      <td>crop_height_google</td>
      <td>height of the crop-box according to Google-SIC</td>
    </tr>
    <tr>
      <th>20</th>
      <td>confidence_apple</td>
      <td>The confidence score associated with the salie...</td>
    </tr>
    <tr>
      <th>21</th>
      <td>sal_x_apple</td>
      <td>abscissa (x-coordinate) of the most salient po...</td>
    </tr>
    <tr>
      <th>22</th>
      <td>sal_y_apple</td>
      <td>ordinate (y-coordinate) of the most salient po...</td>
    </tr>
    <tr>
      <th>23</th>
      <td>top_left_x_apple</td>
      <td>abscissa (x-coordinate) of the top-left crop-b...</td>
    </tr>
    <tr>
      <th>24</th>
      <td>top_left_y_apple</td>
      <td>ordinate (y-coordinate) of the top-left crop-b...</td>
    </tr>
    <tr>
      <th>25</th>
      <td>crop_width_apple</td>
      <td>width of the crop-box according to Apple-SIC</td>
    </tr>
    <tr>
      <th>26</th>
      <td>crop_height_apple</td>
      <td>height of the crop-box according to Apple-SIC</td>
    </tr>
    <tr>
      <th>27</th>
      <td>saliency_map_apple</td>
      <td>The saliency values associated with the 68x68 ...</td>
    </tr>
    <tr>
      <th>28</th>
      <td>mgl</td>
      <td>Binary indicator variable that denotes whether...</td>
    </tr>
  </tbody>
</table>
</div>



# Dataset-2: The CFD experiments spanning 3k images from CFD across 6 RG categories


```python

df_cfd=pd.read_csv('df_cfd_3k.csv')
print(df_cfd.shape)
df_cfd.head(4)
```

    (3000, 37)
    




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>file_name</th>
      <th>file_top</th>
      <th>file_bottom</th>
      <th>combination</th>
      <th>sal_x_twitter</th>
      <th>sal_y_twitter</th>
      <th>top_left_x_twitter</th>
      <th>top_left_y_twitter</th>
      <th>crop_width_twitter</th>
      <th>crop_height_twitter</th>
      <th>...</th>
      <th>top_left_x_apple</th>
      <th>top_left_y_apple</th>
      <th>crop_width_apple</th>
      <th>crop_height_apple</th>
      <th>file_const</th>
      <th>file_ind</th>
      <th>survived_member_twitter</th>
      <th>survived_twitter</th>
      <th>survived_member_apple</th>
      <th>survived_apple</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>BMBF_image_0.png</td>
      <td>CFD-BF-012-001-N.jpg</td>
      <td>CFD-BM-005-003-N.jpg</td>
      <td>BMBF</td>
      <td>375</td>
      <td>375</td>
      <td>0</td>
      <td>212</td>
      <td>583</td>
      <td>326</td>
      <td>...</td>
      <td>127.300053</td>
      <td>0.000000</td>
      <td>319.274691</td>
      <td>3000.000000</td>
      <td>('CFD-BF-012-001-N.jpg', 'CFD-BM-005-003-N.jpg')</td>
      <td>image_0.png</td>
      <td>top</td>
      <td>BF</td>
      <td>top</td>
      <td>BF</td>
    </tr>
    <tr>
      <th>1</th>
      <td>BMBF_image_1.png</td>
      <td>CFD-BF-017-003-N.jpg</td>
      <td>CFD-BM-218-132-N.jpg</td>
      <td>BMBF</td>
      <td>375</td>
      <td>2475</td>
      <td>0</td>
      <td>2312</td>
      <td>583</td>
      <td>326</td>
      <td>...</td>
      <td>125.618151</td>
      <td>0.000000</td>
      <td>316.107482</td>
      <td>3000.000000</td>
      <td>('CFD-BF-017-003-N.jpg', 'CFD-BM-218-132-N.jpg')</td>
      <td>image_1.png</td>
      <td>bottom</td>
      <td>BM</td>
      <td>top</td>
      <td>BF</td>
    </tr>
    <tr>
      <th>2</th>
      <td>BMBF_image_2.png</td>
      <td>CFD-BF-233-116-N.jpg</td>
      <td>CFD-BM-044-001-N.jpg</td>
      <td>BMBF</td>
      <td>225</td>
      <td>375</td>
      <td>0</td>
      <td>212</td>
      <td>583</td>
      <td>326</td>
      <td>...</td>
      <td>157.035997</td>
      <td>972.353697</td>
      <td>266.056601</td>
      <td>2015.235007</td>
      <td>('CFD-BF-233-116-N.jpg', 'CFD-BM-044-001-N.jpg')</td>
      <td>image_2.png</td>
      <td>top</td>
      <td>BF</td>
      <td>bottom</td>
      <td>BM</td>
    </tr>
    <tr>
      <th>3</th>
      <td>BMBF_image_3.png</td>
      <td>CFD-BF-036-027-N.jpg</td>
      <td>CFD-BM-212-117-N.jpg</td>
      <td>BMBF</td>
      <td>225</td>
      <td>2475</td>
      <td>0</td>
      <td>2312</td>
      <td>583</td>
      <td>326</td>
      <td>...</td>
      <td>155.261409</td>
      <td>4.123449</td>
      <td>277.578079</td>
      <td>2994.518638</td>
      <td>('CFD-BF-036-027-N.jpg', 'CFD-BM-212-117-N.jpg')</td>
      <td>image_3.png</td>
      <td>bottom</td>
      <td>BM</td>
      <td>bottom</td>
      <td>BM</td>
    </tr>
  </tbody>
</table>
<p>4 rows × 37 columns</p>
</div>



The descriptions of each of these 37 columns are as captured in ```col_descriptions_cfd_3k.csv```


```python
descr_cfd=pd.read_csv('col_descriptions_cfd_3k.csv')
descr_cfd
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>column_name</th>
      <th>column_description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>file_name</td>
      <td>Name of the image file in the format of RGBott...</td>
    </tr>
    <tr>
      <th>1</th>
      <td>file_top</td>
      <td>CFD image name that was chosen to be the top-i...</td>
    </tr>
    <tr>
      <th>2</th>
      <td>file_bottom</td>
      <td>CFD image name that was chosen to be the botto...</td>
    </tr>
    <tr>
      <th>3</th>
      <td>combination</td>
      <td>RG: Race-Gender combination in the format of R...</td>
    </tr>
    <tr>
      <th>4</th>
      <td>sal_x_twitter</td>
      <td>x-coordinate of the most salient point accordi...</td>
    </tr>
    <tr>
      <th>5</th>
      <td>sal_y_twitter</td>
      <td>y-coordinate of the most salient point accordi...</td>
    </tr>
    <tr>
      <th>6</th>
      <td>top_left_x_twitter</td>
      <td>x-coordinate of the top-left crop-box accordin...</td>
    </tr>
    <tr>
      <th>7</th>
      <td>top_left_y_twitter</td>
      <td>y-coordinate of the top-left crop-box accordin...</td>
    </tr>
    <tr>
      <th>8</th>
      <td>crop_width_twitter</td>
      <td>width of the crop-box according to Twitter-SIC</td>
    </tr>
    <tr>
      <th>9</th>
      <td>crop_height_twitter</td>
      <td>height of the crop-box according to Twitter-SIC</td>
    </tr>
    <tr>
      <th>10</th>
      <td>confidence_google</td>
      <td>The confidence score associated with the salie...</td>
    </tr>
    <tr>
      <th>11</th>
      <td>importance_fraction_google</td>
      <td>The importance fraction of the salient region ...</td>
    </tr>
    <tr>
      <th>12</th>
      <td>top_left_x_google</td>
      <td>x-coordinate of the top-left crop-box accordin...</td>
    </tr>
    <tr>
      <th>13</th>
      <td>top_left_y_google</td>
      <td>y-coordinate of the top-left crop-box accordin...</td>
    </tr>
    <tr>
      <th>14</th>
      <td>top_right_x_google</td>
      <td>x-coordinate of the top-right crop-box accordi...</td>
    </tr>
    <tr>
      <th>15</th>
      <td>top_right_y_google</td>
      <td>y-coordinate of the top-right crop-box accordi...</td>
    </tr>
    <tr>
      <th>16</th>
      <td>bottom_right_x_google</td>
      <td>x-coordinate of the bottom-right crop-box acco...</td>
    </tr>
    <tr>
      <th>17</th>
      <td>bottom_right_y_google</td>
      <td>y-coordinate of the bottom-right crop-box acco...</td>
    </tr>
    <tr>
      <th>18</th>
      <td>bottom_left_x_google</td>
      <td>x-coordinate of the bottom-left crop-box accor...</td>
    </tr>
    <tr>
      <th>19</th>
      <td>bottom_left_y_google</td>
      <td>y-coordinate of the bottom-left crop-box accor...</td>
    </tr>
    <tr>
      <th>20</th>
      <td>survived_google</td>
      <td>The RG combination that survived the cropping ...</td>
    </tr>
    <tr>
      <th>21</th>
      <td>survived_member_google</td>
      <td>Indicates which of the two images (top or bott...</td>
    </tr>
    <tr>
      <th>22</th>
      <td>crop_width_google</td>
      <td>width of the crop-box according to Google-SIC</td>
    </tr>
    <tr>
      <th>23</th>
      <td>crop_height_google</td>
      <td>height of the crop-box according to Google-SIC</td>
    </tr>
    <tr>
      <th>24</th>
      <td>confidence_apple</td>
      <td>The top/bottom combination that survived the c...</td>
    </tr>
    <tr>
      <th>25</th>
      <td>sal_x_apple</td>
      <td>x-coordinate of the most salient point accordi...</td>
    </tr>
    <tr>
      <th>26</th>
      <td>sal_y_apple</td>
      <td>y-coordinate of the most salient point accordi...</td>
    </tr>
    <tr>
      <th>27</th>
      <td>top_left_x_apple</td>
      <td>x-coordinate of the top-left crop-box accordin...</td>
    </tr>
    <tr>
      <th>28</th>
      <td>top_left_y_apple</td>
      <td>y-coordinate of the top-left crop-box accordin...</td>
    </tr>
    <tr>
      <th>29</th>
      <td>crop_width_apple</td>
      <td>width of the crop-box according to Apple-SIC</td>
    </tr>
    <tr>
      <th>30</th>
      <td>crop_height_apple</td>
      <td>height of the crop-box according to Apple-SIC</td>
    </tr>
    <tr>
      <th>31</th>
      <td>file_const</td>
      <td>Ordered pair of the constituent file names  fo...</td>
    </tr>
    <tr>
      <th>32</th>
      <td>file_ind</td>
      <td>Index of the file in the format of image_{n}.png</td>
    </tr>
    <tr>
      <th>33</th>
      <td>survived_member_twitter</td>
      <td>Indicates which of the two images (top or bott...</td>
    </tr>
    <tr>
      <th>34</th>
      <td>survived_twitter</td>
      <td>The RG combination that survived the cropping ...</td>
    </tr>
    <tr>
      <th>35</th>
      <td>survived_member_apple</td>
      <td>Indicates which of the two images (top or bott...</td>
    </tr>
    <tr>
      <th>36</th>
      <td>survived_apple</td>
      <td>The RG combination that survived the cropping ...</td>
    </tr>
  </tbody>
</table>
</div>


