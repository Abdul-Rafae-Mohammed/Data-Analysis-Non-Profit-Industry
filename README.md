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


## Current Use Cases:


### Digital Marketing

* Compare several marketing campaigns and their effectiveness

### Automotive

* Analyze the relationship between Tesla and current oil prices

### Non-Profit

* Insights on American Red Cross data

### E-Commerce

* Identifying profit forecasts for Brazilian e-commerce companies

### Education

* Finding insights on the literacy and education levels of youth living in Kartanaka, India

### Fraud Detection

* Using models to detect fraud detection within financial data

### Health Care

* Insights on prescriber data

### Entertainment

* Understanding the reasoning behind movie ratings and discovering viewer preferences

### FEMA Emergency Assistance Claims

* Discover which areas were most affected by Hurricane Harvey


## Questions?

**Contact Christian Yarros (christian.yarros@oracle.com)**
