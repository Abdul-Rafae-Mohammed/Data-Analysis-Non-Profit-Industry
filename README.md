# Autonomous Data Warehouse Assets

Packaged Industry Use Cases

## Introduction

This repository contains several packaged industry use cases that contain the following:

* Import / Export
  * Loading data from object storage
  * Raw sql file to create tables and import data
* Notebook
  * SQL notebook
* Reset
  * Drop tables and remove data
* Source
  * Various datasets

### Prerequisites

What things you need to install the software and how to install them

```
- OCI Autonomous Data Warehouse
- OCI Object Storage
```

## Configuration/Deployment tips

1. You will need to change the scripts to accommodate for your user/schema.
2. Scripts contain already specified Object Storage buckets in the Demo compartment. If you change the bucket to something new, you will need to change the scripts to accommodate for new bucket name.
3. If you don't want to use Object Storage, the package might contain a raw import that will completely create tables and insert data
4. Once the tables and data are created, you can use an already-configured SQL Notebook by importing the notebook json file.

## Questions?

**Contact Christian Yarros**
