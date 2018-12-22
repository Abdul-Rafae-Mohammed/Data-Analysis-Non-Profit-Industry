DROP TABLE AVG_GAS_PRICES_BY_GALLON_NYC;


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

CREATE TABLE "AVG_GAS_PRICES_BY_GALLON_NYC" 
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
   );
   
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
   


