# FEMA Use Case

ADW data import package for demoing FEMA use case

## Introduction

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them

```
- OCI Autonomous Data Warehouse
- OCI Object Storage
```

### Package Contents


* notebook
  * FEMA_Analysis.json - SQL notebook that includes resetting, loading, querying, and visualizing assistance claim data
* source
  * various datasets


## Configuration/Deployment tips

1. Everything that is needed to start exists in the SQL notebook. Only thing that might need to be modified is the current object storage bucket.
2. Current Object Storage bucket is ADWC_DEMO in the Demo compartment. If you change the bucket to something new, you will need to change the scripts to accommodate for new bucket name. 

## Authors

**Christian Yarros**
