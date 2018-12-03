--============================================================
-- Credentials
--============================================================


set define off
begin
  DBMS_CLOUD.create_credential(
    credential_name => 'OBJ_STORE_CRED',
    username => 'api.user',
    password => 'uJ8fJhnE{<tLX55ql((-'
  );
end;
/
set define on;


--============================================================
-- Data Loading - External Tables
--============================================================

----------------------------------
-- TESLA_STOCK_PRICES
----------------------------------

begin
 dbms_cloud.create_external_table(
    table_name =>'TESLA_STOCK_PRICES',
    credential_name =>'OBJ_STORE_CRED',
    file_uri_list =>'https://swiftobjectstorage.us-ashburn-1.oraclecloud.com/v1/gse00014467/AutomotiveChallenge/tesla_stock_prices.csv',
    format => '{"delimiter" : ",",
                "skipheaders" : "1" ,
                "blankasnull" : "true" ,
                "removequotes" : "true" ,
                "ignoremissingcolumns" : "true",
                "conversionerrors" : "store_null",
                "trimspaces" : "rtrim",
                "escape" : "true"}',
    column_list => '
        	ENTRYDATE DATE, 
            OPEN NUMBER(38,6), 
            HIGH NUMBER(38,6), 
            LOW NUMBER(38,6), 
            CLOSE NUMBER(38,6), 
            VOLUME NUMBER(38,0), 
            ADJCLOSE NUMBER(38,6)
    '
 );
end;
/


----------------------------------
-- GLOBAL_OIL_PRICES
----------------------------------

begin
 dbms_cloud.create_external_table(
    table_name =>'GLOBAL_OIL_PRICES',
    credential_name =>'OBJ_STORE_CRED',
    file_uri_list =>'https://swiftobjectstorage.us-ashburn-1.oraclecloud.com/v1/gse00014467/AutomotiveChallenge/global_oil_prices.csv',
    format => '{"delimiter" : ",",
                "skipheaders" : "1" ,
                "blankasnull" : "true" ,
                "removequotes" : "true" ,
                "ignoremissingcolumns" : "true",
                "conversionerrors" : "store_null",
                "trimspaces" : "rtrim",
                "escape" : "true"}',
    column_list => '
        ENTRY_DATE DATE, 
        EUROPE_PRICE NUMBER(38,2), 
        USA_PRICE NUMBER(38,2)
    '
 );
end;
/


--============================================================
-- Data Loading - Internal Tables
--============================================================

----------------------------------
-- AVG_GAS_PRICES_BY_GALLON_NYC
----------------------------------


CREATE TABLE "CY"."AVG_GAS_PRICES_BY_GALLON_NYC" 
   (	"ENTRYDATE" DATE, 
	"NY_AVG" NUMBER(38,2), 
	"ALBANY_AVG" NUMBER(38,2), 
	"BINGHAMTON_AVG" NUMBER(38,2), 
	"BUFFALO_AVG" NUMBER(38,2), 
	"NASSAU_AVG" NUMBER(38,2), 
	"NYC_AVG" NUMBER(38,2), 
	"ROCHESTER_AVG" NUMBER(38,2), 
	"SYRACUSE_AVG" NUMBER(38,2), 
	"UTICA_AVG" NUMBER(38,2)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 1 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 COLUMN STORE COMPRESS FOR QUERY HIGH ROW LEVEL LOCKING LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;
  
  
begin
 dbms_cloud.copy_data(
    table_name =>'AVG_GAS_PRICES_BY_GALLON_NYC',
    credential_name =>'OBJ_STORE_CRED',
    file_uri_list =>'https://swiftobjectstorage.us-ashburn-1.oraclecloud.com/v1/gse00014467/AutomotiveChallenge/analyzed_comments.csv',
    format => '{"delimiter" : ",",
                "skipheaders" : "1" ,
                "blankasnull" : "true" ,
                "removequotes" : "true" ,
                "ignoremissingcolumns" : "true",
                "conversionerrors" : "store_null",
                "trimspaces" : "rtrim",
                "escape" : "true"}'
 );
end;
/

----------------------------------
-- ANALYZED_COMMENTS
----------------------------------

CREATE TABLE "CY"."ANALYZED_COMMENTS" 
   (	"COMMENTTEXT" VARCHAR2(4000 BYTE), 
	"PATTERN_POLARITY" NUMBER(38,9), 
	"PATTERN_SUBJECTIVITY" NUMBER(38,9), 
	"NAIVESBAYES_PROBABILITY_POSITIVE" NUMBER(38,9), 
	"NAIVESBAYES_PROBABILITY_NEGATIVE" NUMBER(38,11)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 1 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 COLUMN STORE COMPRESS FOR QUERY HIGH ROW LEVEL LOCKING LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;


begin
 dbms_cloud.copy_data(
    table_name =>'ANALYZED_COMMENTS',
    credential_name =>'OBJ_STORE_CRED',
    file_uri_list =>'https://swiftobjectstorage.us-ashburn-1.oraclecloud.com/v1/gse00014467/AutomotiveChallenge/analyzed_comments.csv',
    format => '{"delimiter" : ",",
                "skipheaders" : "1" ,
                "blankasnull" : "true" ,
                "removequotes" : "true" ,
                "ignoremissingcolumns" : "true",
                "conversionerrors" : "store_null",
                "trimspaces" : "rtrim",
                "escape" : "true"}'
 );
end;
/

----------------------------------
-- NORWAY_CAR_SALES
----------------------------------

  CREATE TABLE "CY"."NORWAY_CAR_SALES" 
   (	"YEAR" NUMBER(38,0), 
	"MONTH" NUMBER(38,0), 
	"MAKE" VARCHAR2(26 BYTE), 
	"MODEL" VARCHAR2(26 BYTE), 
	"QUANTITY" NUMBER(38,0), 
	"PCT" NUMBER(38,1)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 1 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 COLUMN STORE COMPRESS FOR QUERY HIGH ROW LEVEL LOCKING LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;


begin
 dbms_cloud.copy_data(
    table_name =>'NORWAY_CAR_SALES',
    credential_name =>'OBJ_STORE_CRED',
    file_uri_list =>'https://swiftobjectstorage.us-ashburn-1.oraclecloud.com/v1/gse00014467/AutomotiveChallenge/norway_car_sales.csv',
    format => '{"delimiter" : ",",
                "skipheaders" : "1" ,
                "blankasnull" : "true" ,
                "removequotes" : "true" ,
                "ignoremissingcolumns" : "true",
                "conversionerrors" : "store_null",
                "trimspaces" : "rtrim",
                "escape" : "true"}'
 );
end;
/

----------------------------------
-- US_CAR_SALES_2011
----------------------------------


  CREATE TABLE "CY"."US_CAR_SALES_2011" 
   (	"MANUFACTURER" VARCHAR2(26 BYTE), 
	"MODEL" VARCHAR2(256 BYTE), 
	"SALES_IN_THOUSANDS" NUMBER(38,3), 
	"PRICE_IN_THOUSANDS" NUMBER(38,3), 
	"ENGINE_SIZE" NUMBER(38,1), 
	"HORSEPOWER" NUMBER(38,0), 
	"WHEELBASE" NUMBER(38,1), 
	"WIDTH" NUMBER(38,1), 
	"LENGTH" NUMBER(38,1), 
	"CURB_WEIGHT" NUMBER(38,3), 
	"FUEL_CAPACITY" NUMBER(38,1), 
	"FUEL_EFFICIENCY" NUMBER(38,0), 
	"LATEST_LAUNCH" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 1 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 COLUMN STORE COMPRESS FOR QUERY HIGH ROW LEVEL LOCKING LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;
  
  
  begin
 dbms_cloud.copy_data(
    table_name =>'US_CAR_SALES_2011',
    credential_name =>'OBJ_STORE_CRED',
    file_uri_list =>'https://swiftobjectstorage.us-ashburn-1.oraclecloud.com/v1/gse00014467/AutomotiveChallenge/us_car_sales.csv',
    format => '{"delimiter" : ",",
                "skipheaders" : "1" ,
                "blankasnull" : "true" ,
                "removequotes" : "true" ,
                "ignoremissingcolumns" : "true",
                "conversionerrors" : "store_null",
                "trimspaces" : "rtrim",
                "escape" : "true"}'
 );
end;
/

----------------------------------
-- EV_REBATE_COMMENTS
----------------------------------

  CREATE TABLE "CY"."EV_REBATE_COMMENTS" 
   (	"FIRSTNAME" VARCHAR2(26 BYTE), 
	"LASTNAME" VARCHAR2(26 BYTE), 
	"EMAILADDRESS" VARCHAR2(128 BYTE), 
	"ORGANIZATION" VARCHAR2(256 BYTE), 
	"STATE" VARCHAR2(26 BYTE), 
	"COMMENTDESCRIPTION" VARCHAR2(4000 BYTE), 
	"ADDITIONALDOCUMENT" VARCHAR2(1024 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 1 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 COLUMN STORE COMPRESS FOR QUERY HIGH ROW LEVEL LOCKING LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;
  

begin
 dbms_cloud.copy_data(
    table_name =>'EV_REBATE_COMMENTS',
    credential_name =>'OBJ_STORE_CRED',
    file_uri_list =>'https://swiftobjectstorage.us-ashburn-1.oraclecloud.com/v1/gse00014467/AutomotiveChallenge/ev_rebate_comments.csv',
    format => '{"delimiter" : ",",
                "skipheaders" : "1" ,
                "blankasnull" : "true" ,
                "removequotes" : "true" ,
                "ignoremissingcolumns" : "true",
                "conversionerrors" : "store_null",
                "trimspaces" : "rtrim",
                "escape" : "true"}'
 );
end;
/
  
  