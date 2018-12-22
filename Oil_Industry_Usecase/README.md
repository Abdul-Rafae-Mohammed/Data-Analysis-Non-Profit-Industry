# Oil Industry Use Case

ADW data import package for demoing oil industry use case

## Introduction

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them

```
- OCI Autonomous Data Warehouse
- OCI Object Storage
```

### Package Contents

* scripts
  * external_tables.sql - example of loading raw data from object storage to external tables using sql scripts
  * ADWC_Stuti Benchmark Queries.sql - sample benchmark queries to demonstrate the core features of ADWC
  * credential.sql - how to setup the user based secure connection with ADWC
* Notebook
  * Oil Industry Usecase.json - SQL notebook
* Dataset
  * Oil Industry Dataset related to accidents happening due to Oil spill and pipeline leakage



## Configuration/Deployment tips

1. ADW User is currently stuti.deshpande@oracle.com, you will need to change the scripts to accommodate for your user/schema.
2. Current Object Storage bucket is OilAndGasIndustry in the Demo compartment. If you change the bucket to something new, you will need to change the scripts to accommodate for new bucket name.
3. If you don't want to use Object Storage, raw import will completely create tables and insert data. This method has been used here to create tables and insert data directly from the csv file
4. Once the tables and data are created, you can use an already-configured SQL Notebook by importing AutomotiveNotebook.json

## Author

**Stuti Deshpande**
