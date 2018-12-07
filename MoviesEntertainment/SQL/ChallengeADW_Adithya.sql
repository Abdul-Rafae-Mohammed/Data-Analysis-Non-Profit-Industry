
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



begin
 dbms_cloud.create_external_table(
    table_name =>'RATINGS',
    credential_name =>'OBJ_STORE_CRED',
    file_uri_list =>'https://swiftobjectstorage.us-ashburn-1.oraclecloud.com/v1/gse00014467/Adithya_ADWC_Movies/ratings.csv',
    format => '{"delimiter" : ",",
                "skipheaders" : "1" ,
                "blankasnull" : "true" ,
                "removequotes" : "true" ,
                "ignoremissingcolumns" : "true",
                "conversionerrors" : "store_null",
                "trimspaces" : "rtrim",
                "escape" : "true"}',
    column_list => '
        	USERID NUMBER(6,0),
            MOVIEID NUMBER(10,0),
            RATING NUMBER(5,2),
            TIMESTAMP NUMBER(20,0)
    '
 );
end;
/