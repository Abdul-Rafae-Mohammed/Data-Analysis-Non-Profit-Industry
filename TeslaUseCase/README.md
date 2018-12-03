# Automotive Industry Use Case

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
  * os-import.sql - loading data from object storage
  * raw-import.sql - raw sql file to create tables and import data
* notebook
  * AutomotiveNotebook.json - SQL notebook
* reset
  * AutomotiveReset.sql - drop tables and remove data
* source
  * various datasets


## Configuration/Deployment tips

1. ADW User is currently CY, you will need to change the scripts to accommodate for your user/schema.
2. Current Object Storage bucket is AutomotiveChallenge in the Demo compartment. If you change the bucket to something new, you will need to change the scripts to accommodate for new bucket name.
3. If you don't want to use Object Storage, raw import will completely create tables and insert data
4. Once the tables and data are created, you can use an already-configured SQL Notebook by importing AutomotiveNotebook.json

## Authors

**Christian Yarros**
