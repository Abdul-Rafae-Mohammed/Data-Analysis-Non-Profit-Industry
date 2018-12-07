# Retail/Ecommerce Industry Use Case

ADW data import package for demoing retail/ecommerce industry use case

## Introduction

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them

```
- OCI Autonomous Data Warehouse
- OCI Object Storage(optional)
```

### Package Contents

* Import-export
  * Datasets are not included in the package but url for downloading is provided. You can upload them to Object Storage and import the table or Import data to Table through SQL Developer(recommend).
* Notebook
  * Brazilian Ecommerce EDA.json - SQL notebook
* Source
  * Datasets - brazilian ecommerce, from Kaggle.com (url: https://www.kaggle.com/olistbr/brazilian-ecommerce)

### Instructions

* Download datasets from url
* Load data into ADWC 
* Import SQL notebook (.json file) to Oracle Machine Learning
* Run notebook 

## Configuration/Deployment tips

1. Script to load data from object storage is currently unavailable and will be included in the future. For now, please use Oracle SQL Developer to load data into ADWC
2. ADW User is currently SIYUAN, you will need to change the scripts to accommodate for your user/schema.
3. Current Object Storage bucket is Asset in the Demo compartment. If you change the bucket to something new, you will need to change the scripts to accommodate for new bucket name.
4. If you don't want to use Object Storage, raw import will completely create tables and insert data(recommend)
5. Once the tables and data are created, you can use an already-configured SQL Notebook by importing Brazilian Ecommerce EDA.json

## Authors

**Siyuan Yin**
