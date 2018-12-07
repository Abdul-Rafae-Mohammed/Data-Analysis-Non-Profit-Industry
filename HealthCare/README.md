# Healthcare Industry Use Case 

ADW data import package for demoing Healthcare use case :hospital: :pill:

## Introduction

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them

```
- OCI Autonomous Data Warehouse
- OCI Object Storage
```

### Package Contents

* import-export
  * Download the Healthcare folder
  * To import data run the dataload.sh and fill the details as prompted
  ```
  ./dataload.sh
  ```
  **Note** : Before you run the script unzip the data files. The script is automated to load data to object store, create table and load data into the table 
  
  
* notebook
  * Import HealthTest.json - SQL notebook
* reset
  * To reset just run dataload.sh .sql - drop tables and remove data
* source
  * various datasets


## Configuration/Deployment tips

1. **_OCI-CLI must be Installed on the local machine. To install follow the [link](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/cliconcepts.htm)_**  
2. Follow the instructions the load scripts provide and fill appropriate details.
3. Create a bucket, user and auth_token 
4. Once the tables and data are created, you can use an already-configured SQL Notebook by importing HealthTest.json

## Authors

**Phani Turlapati (phani.turlapati@oracle.com)**

## References
  1. Dataset : [CMS Presciber Data](https://www.kaggle.com/cms/cms-part-d-prescriber-summary-reports-2013-2016)
  2. [Autonomous datawarehouse](https://docs.cloud.oracle.com/iaas/Content/Database/Concepts/adwoverview.htm)
  3. [Oracle Object Storage](https://docs.cloud.oracle.com/iaas/Content/Object/Concepts/objectstorageoverview.htm)
  4. [OCI - Oracle Gen2 Cloud](https://docs.cloud.oracle.com/iaas/Content/home.htm)
