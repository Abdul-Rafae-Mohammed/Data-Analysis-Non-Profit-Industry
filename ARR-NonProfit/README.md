# Non Profit Industry Use Case

ADW data import package for demoing automotive use case

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
  * data_import_toDB.sql - loading data from object storage
* notebook
  * American Red Cross.json - SQL notebook
* reset
  * ARRReset.sql - drop tables and remove data
* source
  * various datasets


## Configuration/Deployment tips

1. In ARRReset.sql, you have to give the correct table name which you have given while importing the data.
2. In Data_import_toDb.sql script, You have to give the correct user credentials for the user you are using, while creating the credential.
3. If you don't want to use Object Storage, You can also use local option while importing data using SQL Developer
4. Once the tables and data are created, you can use an already-configured SQL Notebook by importing American Red Cross.json

## Authors

**Abdul Rafae Mohammed(abdul.rafae.mohammed@oracle.com)**
