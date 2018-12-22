DROP TABLE OILANDGAS;

set define off
begin
  DBMS_CLOUD.create_credential(
    credential_name => 'OBJ_STORE_CRED',
    username => 'stuti.deshpande@oracle.com',
    password => ''
  );
end;
/
set define on;


