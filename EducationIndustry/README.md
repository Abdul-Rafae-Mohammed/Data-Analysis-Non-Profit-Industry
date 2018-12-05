# Education Industry Use Case

ADW data import package for demoing education industry use case

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
  * Data set has been included in the package. You can upload it to Object Storage and import the table or Import data to Table through SQL Developer.
  * Data set Name - karanatakaEducation.csv
* SQL Developer scripts are all found in Asset.sql
  * Please do not forget to change your Bucket Name, and data set name and base URL
* notebook
  * Asset.json - SQL notebook
* source
  * data.gov.in


## Configuration/Deployment tips

1. ADW User is currently Tejus, you will need to change the scripts to accommodate for your user/schema.
2. Current Object Storage bucket is Asset in the Demo compartment. If you change the bucket to something new, you will need to change the scripts to accommodate for new bucket name.
3. If you don't want to use Object Storage, raw import will completely create tables and insert data
4. Once the tables and data are created, you can use an already-configured SQL Notebook by importing Asset.json

## Authors

**Tejus Subrahmanya**
