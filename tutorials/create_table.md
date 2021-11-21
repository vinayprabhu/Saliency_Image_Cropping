

```python
import numpy as np
import os
import pandas as pd
import matplotlib.pyplot as plt
import pandas as pd
%matplotlib inline

from scipy.linalg import block_diag
# Don't do linear algebra in Python without these two lines
np.set_printoptions(suppress=True)
from collections import Counter
from IPython.display import set_matplotlib_formats
set_matplotlib_formats('retina')

%precision 3
#############################################
import sys
import importlib
importlib.reload(sys)
#######################
from google.colab import drive
drive.flush_and_unmount()
import os
```

    Drive not mounted, so nothing to flush and unmount.



```python
with open('google_dataset_raw.txt') as f:
    lines = f.readlines()
```


```python
updated_ind=np.where(['Updated' in l for l in lines])[0]
updated_ind
```




    array([  3,   7,  10,  15,  20,  24,  28,  33,  38,  43,  48,  53,  58,
            66,  71,  76,  80,  86,  90,  96, 101, 106, 111, 116, 121, 126,
           130, 135, 142, 148, 154, 161, 166, 171, 177, 182, 187, 193, 199,
           204, 209, 214, 219, 224, 229, 236, 243, 250, 255, 259, 266, 271,
           275, 282, 287, 291, 296, 306, 311, 318, 322, 327, 332, 338, 343,
           348, 352, 357, 361, 366, 372, 379, 383, 387, 392, 397, 403, 408,
           412, 417, 422, 426, 433, 437, 442, 447, 454, 459, 464, 469, 474,
           480, 486, 490, 496, 501, 507, 513, 519, 524, 529, 534, 539, 545,
           549, 554, 558, 563, 568, 572, 577, 582, 590, 594, 599, 607, 613,
           618, 622, 626, 633, 638, 644, 650, 655, 660, 666, 672, 678, 684,
           690, 695, 700, 705, 710, 715, 719, 724, 730, 735, 744, 748, 753,
           758, 764, 769, 779, 785, 790, 795, 800, 805, 813, 820, 828, 835,
           846, 853, 862, 866, 871, 876, 880, 885, 891, 897, 901, 906, 910,
           916, 920, 924, 929, 933, 941, 945, 949, 954, 959])




```python
df_comb=pd.DataFrame(columns=['dataset_title','url_src','date'])
prev_ind=0
for i,ind in enumerate(updated_ind):
  df_comb.loc[i,'date']=lines[ind].split('Updated')[-1].lstrip().rstrip()
  list_ind=lines[prev_ind:ind]
  # Remove garbage entries with low str length
  array_ind=np.array(list_ind)[[len(l)>5 for l in list_ind]]
  df_comb.loc[i,['dataset_title']]=array_ind[0].strip('\n')
  df_comb.loc[i,['url_src']]=array_ind[1].strip('\n')
  prev_ind=ind+1
  
```


```python
df_ds=df_comb.drop_duplicates(
  subset = ['dataset_title','url_src'],
  keep = 'last').reset_index(drop = True)
```


```python
df_ds
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
      <th>dataset_title</th>
      <th>url_src</th>
      <th>date</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Newcastle polysomnography and accelerometer data</td>
      <td>zenodo.org</td>
      <td>Jan 25, 2018</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Accelerometer data collected using a number of...</td>
      <td>eprints.soton.ac.uk</td>
      <td>Jul 19, 2017</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Golden Gate Bridge Accelerometer Data</td>
      <td>www.kaggle.com</td>
      <td>May 13, 2018</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Data from: Analysis of animal accelerometer da...</td>
      <td>explore.openaire.eu</td>
      <td>Oct 1, 2016</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Smartphone Gyroscope and Accelerometer Dataset...</td>
      <td>zenodo.org</td>
      <td>Jul 2, 2020</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>171</th>
      <td>Stumblemeter: App and MATLAB code</td>
      <td>www.narcis.nl</td>
      <td>Apr 28, 2021</td>
    </tr>
    <tr>
      <th>172</th>
      <td>J04_accelerometer_all</td>
      <td>www.neracoos.org</td>
      <td>Jan 31, 2021</td>
    </tr>
    <tr>
      <th>173</th>
      <td>Raw accelerometer data</td>
      <td>search.datacite.org</td>
      <td>2017</td>
    </tr>
    <tr>
      <th>174</th>
      <td>Processed acceleromter data</td>
      <td>figshare.com</td>
      <td>Jun 26, 2020</td>
    </tr>
    <tr>
      <th>175</th>
      <td>Dataset: Long-term activity recognition from w...</td>
      <td>figshare.com</td>
      <td>Jan 19, 2016</td>
    </tr>
  </tbody>
</table>
<p>176 rows × 3 columns</p>
</div>




```python
176/13
```




    13.538




```python
fellows_list=['Stephanie Tietz',
'Iris Chang',
'Sanjana Sarda',
'Shruti Chaturvedi',
'Alicia Boyd',
'Alexander Ke',
'Dereje Workneh',
'Ryan Teehan',
'Danny Tse',
'Nicholas Roberts',
'Jiahui Chen',
'Patrick Liu',
'Jaiden Reddy']
names_rep=fellows_list*int(np.ceil(df_ds.shape[0]/len(fellows_list)))
df_ds['fellow_allocated']=names_rep[0:df_ds.shape[0]]
df_ds
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
      <th>dataset_title</th>
      <th>url_src</th>
      <th>date</th>
      <th>fellow_allocated</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Newcastle polysomnography and accelerometer data</td>
      <td>zenodo.org</td>
      <td>Jan 25, 2018</td>
      <td>Stephanie Tietz</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Accelerometer data collected using a number of...</td>
      <td>eprints.soton.ac.uk</td>
      <td>Jul 19, 2017</td>
      <td>Iris Chang</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Golden Gate Bridge Accelerometer Data</td>
      <td>www.kaggle.com</td>
      <td>May 13, 2018</td>
      <td>Sanjana Sarda</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Data from: Analysis of animal accelerometer da...</td>
      <td>explore.openaire.eu</td>
      <td>Oct 1, 2016</td>
      <td>Shruti Chaturvedi</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Smartphone Gyroscope and Accelerometer Dataset...</td>
      <td>zenodo.org</td>
      <td>Jul 2, 2020</td>
      <td>Alicia Boyd</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>171</th>
      <td>Stumblemeter: App and MATLAB code</td>
      <td>www.narcis.nl</td>
      <td>Apr 28, 2021</td>
      <td>Sanjana Sarda</td>
    </tr>
    <tr>
      <th>172</th>
      <td>J04_accelerometer_all</td>
      <td>www.neracoos.org</td>
      <td>Jan 31, 2021</td>
      <td>Shruti Chaturvedi</td>
    </tr>
    <tr>
      <th>173</th>
      <td>Raw accelerometer data</td>
      <td>search.datacite.org</td>
      <td>2017</td>
      <td>Alicia Boyd</td>
    </tr>
    <tr>
      <th>174</th>
      <td>Processed acceleromter data</td>
      <td>figshare.com</td>
      <td>Jun 26, 2020</td>
      <td>Alexander Ke</td>
    </tr>
    <tr>
      <th>175</th>
      <td>Dataset: Long-term activity recognition from w...</td>
      <td>figshare.com</td>
      <td>Jan 19, 2016</td>
      <td>Dereje Workneh</td>
    </tr>
  </tbody>
</table>
<p>176 rows × 4 columns</p>
</div>




```python
df_ds.to_csv('df_datasets_allocated.csv',index=False)
```
