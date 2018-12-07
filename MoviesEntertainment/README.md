# Entertainment Industry Use Case

Autonomous Data Warehouse Demo with Entertainment Industry Use Case

## Introduction

Every movie that is released to the public gets reviewed by critics and others on various online platforms. This includes textual reviews as well as numerical ratings. Here we are trying to understand if there is any strong reason for a movie to get a better rating than another one.
For example: There could be a particular actor or a producer who always gets a high rating.

## Data
The data consists of details like casts, crews, release dates, production house, etc for about 45,500 movies split into multiple files. It also had multiple columns with values formatted as a JSON Object or a JSON Array. These files were combined to get a single comma separated values file by merging the important columns. Separately, the dataset also consisted of a file with more than 26 million ratings for the movies from 270,000 people. The data was further normalised to improve query execution and efficient data analysis.

##### Raw Data: [Kaggle](https://www.kaggle.com/rounakbanik/the-movies-dataset)
##### Clean Data: [OraDocs](https://oradocs-corp.documents.us2.oraclecloud.com/documents/link/LF7E781F82AFB6FC1498A5D7F6C3FF17C1177A968060/folder/F81A9E1375BA7A63D3F40744F6C3FF17C1177A968060/_TeamChallenge___ADWC___Entertainment___Clean_Data)

## Prerequisites

In order to get the demo up and running, the following services/software are required:

```
- OCI Autonomous Data Warehouse
- OCI Object Storage
- Oracle SQL Developer
```

## Package Contents

* SQL
  * ChallengeADW_Adithya.sql - Loading data from object storage
  * ChallengeADW_Adithya_RESET.sql - Drop table and remove data
* Notebooks
  * MoviesEntertainmentNotebook.json - SQL notebook to be uploaded on ADWC ML Platform


## Configuration/Deployment tips

1. Have all pre-requisites ready and running
2. Verify and update the following in the SQL Files and Notebook files:
  * ADW User Name
  * Environment Name
  * Bucket Name 
  * Object Store Credentials
3. Upload the "Ratings.csv" file to Object Store
4. Use the ChallengeADW_Adithya.sql file to create an external table on ADWC through SQL Developer
5. Upload the other files from the "Clean Data" folder to ADWC using SQL Developer File upload wizard
6. Once the tables and data are created, you can use an already-configured SQL Notebook by importing MoviesEntertainmentNotebook.json
7. Finally, after the demo, use the ChallengeADW_Adithya_RESET.sql file to delete the tables and prepare for the next demo

## Authors

**Adithya Raam Sankar**
