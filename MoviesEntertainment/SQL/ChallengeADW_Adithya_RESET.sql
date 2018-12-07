BEGIN
  DBMS_CLOUD.drop_credential(credential_name => 'OBJ_STORE_CRED');
END;
/

DROP TABLE RATINGS_EXT;