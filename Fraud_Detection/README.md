# Fraud Detection - Finance Industry Use Case

ADW data import package for demoing fraud detection use case

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
  * os-import.sql - loading data from object storage \
  NOTE: This dataset is different from the one used in the Fraud Detection use case, please use raw-import.sql or downlaod the dataset from Kaggle (link given below) to proceed with fraud detection.
  * raw-import.sql - raw sql file to create tables and import data
* notebook
  * BankSim_1.json - SQL notebook
* reset
  * reset.sql - drop tables and remove data
* source
  * bank_transactions.csv - source dataset or you can downlaod from this [Kaggle](https://www.kaggle.com/ntnu-testimon/banksim1#bs140513_032310.csv) link. Please download one file **bs140513_032310.csv**, this is the bank_transactions.csv file in the source folder. \
  NOTE: If you are loading data from this csv file, you can choose not to load columns *zipcodeOri* and *zipMerchant* as they both are the same in the entire dataset.


## Configuration/Deployment tips

1. ADW User is currently SRAVYA, you will need to change the scripts to accommodate for your user/schema.
2. Current Object Storage bucket is AutomotiveChallenge in the Demo compartment. If you change the bucket to something new, you will need to change the scripts to accommodate for new bucket name.
3. If you don't want to use Object Storage, raw import will completely create tables and insert data
4. Once the tables and data are created, you can use an already-configured SQL Notebook by importing BankSim_1.json

## Authors

**Sravya Ganugapati**
