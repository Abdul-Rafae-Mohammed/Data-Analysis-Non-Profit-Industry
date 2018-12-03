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


-- Steps
-- 1. Create/Use an existing Auth Token for the user you are trying to use for this Asset in the Tenancy(Eg: api.user, etc) and copy the token which will the password for the
--    credential are going to create to connect the object store to the DB.
-- 2. Copy the CSV files to the Object Store.
-- 3. In SQL Developer, Create a connection to the DB you want to upload the data.
--    You will need a DB Credential Wallet, Username(admin) and Password for the DB used while creating the DB,select the role as default
-- 3.1 Right click the connection in SQL Developer you created and open a new sql sorksheet
-- 3.2 Create the credential by running the above code in SQL Developer worksheet with the correct user and password/Auth Token(which you saved in step 1)
-- 4. Expand the Connection in SQL developer and right click the Tables folder
-- 5. Select the "Import Data" option
-- 6. Select the Oracle Cloud Storage from Drop Box
-- 7. Give the path for the file you want to upload from Object storage
-- For Eg: https://swiftobjectstorage.us-ashburn-1.oraclecloud.com/v1/<tenancy>/<Bucket name in Object Storage>/<Filename with extension>
-- 8. Select the credential you created earlier and click preview
-- 9. Click next and enter the table name
-- 10. Click next and ,make sure the data in each column does not conflict (You might have to change the size of the columns or the data type of some columns 
--     if they are wrong)
-- 11. Click Next and Click Test and check that the TEST is a SUCCESS.
-- 12. Click next and click finish.
-- 13. Repeat the steps 4 - 12 for each file you want to upload.