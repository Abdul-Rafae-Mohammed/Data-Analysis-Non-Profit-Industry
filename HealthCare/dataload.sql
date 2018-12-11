 -------------------------------------------------------------------------------
-- Author       Phani Turlapati
-- Created      08/02/2018
-- Purpose      Loading Health data to ADWC
-- Copyright © 2018, Oracle Inc, All Rights Reserved
-------------------------------------------------------------------------------
-- Modification History
--
-- 12/06/2018  Phani Turlapati  
--      First Commit : creating user & loading data from object store
-------------------------------------------------------------------------------

set echo off 
set define '&'
set sqlprompt ""
set VERIFY off
spool dataload.log


--Create med_user 
CREATE USER med_user1 IDENTIFIED BY WElCome12_34#;

--Grant DWRole to the med_user
Grant DWROLE to med_user1;

connect med_user1/WElCome12_34#@&6

--SetUp cloud user credentials 

BEGIN
  begin
  DBMS_CLOUD.DROP_CREDENTIAL ('med_user_creds');
  exception
    when others then
      null;
  end;
  DBMS_CLOUD.CREATE_CREDENTIAL(
    credential_name => 'med_user_creds',
    username => '&1',
    password => '&2'
  );
END;
/

--Create table 
drop table national_prescriber_data;
create table national_prescriber_data (
Drug_Name                                                           varchar2(2000),
Generic_Name	                                                    varchar2(2000),    
No_of_Prescribers 	                                                number,
No_of_Medicare_Part_D_Claims 	                                    number,
No_of_Standardized_30_Day_Part_D_Fills 	                            number,
Aggregate_Cost_Paid_for_Part_D_Claims	                            number,
Number_of_Medicare_Beneficiaries 	                                number,
GE65_Suppression_Flag 	                                            varchar2(2000),
Number_of_Medicare_Part_D_Claims_for_Beneficiaries_65 	            number,
Number_of_Standardized_30_Day_Part_D_Fills_for_Beneficiaries_65 	number,
Aggregate_Cost_Paid_for_Part_D_Claims_for_Beneficiaries_65	        number,
Beneficiary_65_Suppression_Flag 	                                number,
Number_of_Medicare_Beneficiaries_65 	                            number,
Aggregate_Cost_Share_for_Beneficiaries_with_Low_Income_Subsidy	    number,
Aggregate_Cost_Share_for_Beneficiaries_with_No_Low_Income_Subsidy   number,
Opioid_Drug_Flag                                                    varchar2(2000),
Long_Acting_Opioid_Drug_Flag                                        varchar2(2000),
Antibiotic_Drug_Flag                                                varchar2(2000),    
Antipsychotic_Drug_Flag                                             varchar2(2000),
rx_year                                                             number        
)
/



drop table state_prescriber_data;
create table state_prescriber_data (
State_Name                                                          varchar2(2000),
Drug_Name                                                           varchar2(2000),
Generic_Name	                                                    varchar2(2000),    
No_of_Prescribers 	                                                number,
No_of_Medicare_Part_D_Claims 	                                    number,
No_of_Standardized_30_Day_Part_D_Fills 	                            number,
Aggregate_Cost_Paid_for_Part_D_Claims	                            number,
Number_of_Medicare_Beneficiaries 	                                number,
GE65_Suppression_Flag 	                                            varchar(2000),
Number_of_Medicare_Part_D_Claims_for_Beneficiaries_65 	            number,
Number_of_Standardized_30_Day_Part_D_Fills_for_Beneficiaries_65 	number,
Aggregate_Cost_Paid_for_Part_D_Claims_for_Beneficiaries_65	        number,
Beneficiary_65_Suppression_Flag 	                                number,
Number_of_Medicare_Beneficiaries_65 	                            number,
Aggregate_Cost_Share_for_Beneficiaries_with_Low_Income_Subsidy	    number,
Aggregate_Cost_Share_for_Beneficiaries_with_No_Low_Income_Subsidy   number,
Opioid_Drug_Flag                                                    varchar2(2000),
Long_Acting_Opioid_Drug_Flag                                        varchar2(2000),
Antibiotic_Drug_Flag                                                varchar2(2000),    
Antipsychotic_Drug_Flag                                             varchar2(2000),
RX_YEAR                                                             number
)
/


--Grant all privileges to tables 

grant  ALL PRIVILEGES on national_prescriber_data to public;
grant  ALL PRIVILEGES on state_prescriber_data to public;

define url_national  = 'https://swiftobjectstorage.us-ashburn-1.oraclecloud.com/v1/gse00015652/challengeBucket/part-d-prescriber-national-summary-report-calendar-year-'
define url_state = 'https://swiftobjectstorage.us-ashburn-1.oraclecloud.com/v1/gse00015652/challengeBucket/part-d-prescriber-state-summary-report-calendar-year-'

-- Load Data 



--Create table 
drop table national_prescriber_data;
create table national_prescriber_data (
Drug_Name                                                           varchar2(2000),
Generic_Name	                                                    varchar2(2000),    
No_of_Prescribers 	                                                number,
No_of_Medicare_Part_D_Claims 	                                    number,
No_of_Standardized_30_Day_Part_D_Fills 	                            number,
Aggregate_Cost_Paid_for_Part_D_Claims	                            number,
Number_of_Medicare_Beneficiaries 	                                number,
GE65_Suppression_Flag 	                                            varchar2(2000),
Number_of_Medicare_Part_D_Claims_for_Beneficiaries_65 	            number,
Number_of_Standardized_30_Day_Part_D_Fills_for_Beneficiaries_65 	number,
Aggregate_Cost_Paid_for_Part_D_Claims_for_Beneficiaries_65	        number,
Beneficiary_65_Suppression_Flag 	                                number,
Number_of_Medicare_Beneficiaries_65 	                            number,
Aggregate_Cost_Share_for_Beneficiaries_with_Low_Income_Subsidy	    number,
Aggregate_Cost_Share_for_Beneficiaries_with_No_Low_Income_Subsidy   number,
Opioid_Drug_Flag                                                    varchar2(2000),
Long_Acting_Opioid_Drug_Flag                                        varchar2(2000),
Antibiotic_Drug_Flag                                                varchar2(2000),    
Antipsychotic_Drug_Flag                                             varchar2(2000),
rx_year                                                             varchar2(2000)        
)
/


drop table state_prescriber_data;
create table state_prescriber_data (
State_Name                                                          varchar2(2000),
Drug_Name                                                           varchar2(2000),
Generic_Name	                                                    varchar2(2000),    
No_of_Prescribers 	                                                number,
No_of_Medicare_Part_D_Claims 	                                    number,
No_of_Standardized_30_Day_Part_D_Fills 	                            number,
Aggregate_Cost_Paid_for_Part_D_Claims	                            number,
Number_of_Medicare_Beneficiaries 	                                number,
GE65_Suppression_Flag 	                                            varchar(2000),
Number_of_Medicare_Part_D_Claims_for_Beneficiaries_65 	            number,
Number_of_Standardized_30_Day_Part_D_Fills_for_Beneficiaries_65 	number,
Aggregate_Cost_Paid_for_Part_D_Claims_for_Beneficiaries_65	        number,
Beneficiary_65_Suppression_Flag 	                                number,
Number_of_Medicare_Beneficiaries_65 	                            number,
Aggregate_Cost_Share_for_Beneficiaries_with_Low_Income_Subsidy	    number,
Aggregate_Cost_Share_for_Beneficiaries_with_No_Low_Income_Subsidy   number,
Opioid_Drug_Flag                                                    varchar2(2000),
Long_Acting_Opioid_Drug_Flag                                        varchar2(2000),
Antibiotic_Drug_Flag                                                varchar2(2000),    
Antipsychotic_Drug_Flag                                             varchar2(2000),
RX_YEAR                                                             varchar2(2000)
)
/





-- Load Data


drop table loaddata;
create table loaddata (
c01 varchar2(2000),
c02 varchar2(2000),    
c03 varchar2(2000),
c04 varchar2(2000),
c05 varchar2(2000),
c06	varchar2(2000),
c07 varchar2(2000),
c08 varchar2(2000),
c09 varchar2(2000),
c10 varchar2(2000),
c11 varchar2(2000),
c12 varchar2(2000),
c13 varchar2(2000),
c14 varchar2(2000),
c15 varchar2(2000),
c16 varchar2(2000),
c17 varchar2(2000),
c18 varchar2(2000),    
c19 varchar2(2000)      
)
/


declare 
 url_update varchar2(2000) := '&url_national';
begin
  for y in 2013 .. 2016 loop
     
     execute immediate 'drop table loaddata';
     
    dbms_output.put_line(url_update);
   DBMS_CLOUD.CREATE_EXTERNAL_TABLE (
	table_name => 'loaddata',
	credential_name =>'med_user_creds',	
	file_uri_list =>url_update||y||'.csv',	
	column_list => 'c01 varchar2(2000),
                    c02 varchar2(2000),    
                    c03 varchar2(2000),
                    c04 varchar2(2000),
                    c05 varchar2(2000),
                    c06	varchar2(2000),
                    c07 varchar2(2000),
                    c08 varchar2(2000),
                    c09 varchar2(2000),
                    c10 varchar2(2000),
                    c11 varchar2(2000),
                    c12 varchar2(2000),
                    c13 varchar2(2000),
                    c14 varchar2(2000),
                    c15 varchar2(2000),
                    c16 varchar2(2000),
                    c17 varchar2(2000),
                    c18 varchar2(2000),    
                    c19 varchar2(2000) ',
	format => json_object( 'delimiter' value ',', 
      'ignoremissingcolumns' value 'true',
      'removequotes' value 'true',
                             'blankasnull' value 'true',
                             'skipheaders' value '1' ));
  
    insert into NATIONAL_PRESCRIBER_DATA (
        Drug_Name,
        Generic_Name,
        No_of_Prescribers,
        No_of_Medicare_Part_D_Claims, 
        No_of_Standardized_30_Day_Part_D_Fills, 
        Aggregate_Cost_Paid_for_Part_D_Claims,
        Number_of_Medicare_Beneficiaries,
        GE65_Suppression_Flag,
        Number_of_Medicare_Part_D_Claims_for_Beneficiaries_65, 
        Number_of_Standardized_30_Day_Part_D_Fills_for_Beneficiaries_65,
        Aggregate_Cost_Paid_for_Part_D_Claims_for_Beneficiaries_65,
        Beneficiary_65_Suppression_Flag,
        Number_of_Medicare_Beneficiaries_65,
        Aggregate_Cost_Share_for_Beneficiaries_with_Low_Income_Subsidy,
        Aggregate_Cost_Share_for_Beneficiaries_with_No_Low_Income_Subsidy,
        Opioid_Drug_Flag,
        Long_Acting_Opioid_Drug_Flag,
        Antibiotic_Drug_Flag,
        Antipsychotic_Drug_Flag, 
        RX_YEAR) select
            c01 ,
            c02 ,    
            translate (c03, '*#$%^()', '0000000') ,
            translate (c04, '*#$%^()', '0000000') ,
            translate (c05, '*#$%^()', '0000000') ,
            translate (c06, '*#$%^()', '0000000') ,
            translate (c07, '*#$%^()', '0000000') , 
            c08 ,
            translate (c09, '*#$%^()', '0000000') , 
            translate (c10, '*#$%^()', '0000000') , 
            translate (c11, '*#$%^()', '0000000') , 
            translate (c12, '*#$%^()', '0000000') , 
            translate (c13, '*#$%^()', '0000000') , 
            translate (c14, '*#$%^()', '0000000') , 
            translate (c15, '*#$%^()', '0000000') , 
            c16 ,
            c17 ,
            c18 ,    
            c19 , y from loaddata;
            
  end loop;
  commit;
end;
/


select rx_year, count(*) from NATIONAL_PRESCRIBER_DATA group by RX_year;


drop table loaddata;
create table loaddata (
c01 varchar2(2000),
c02 varchar2(2000),    
c03 varchar2(2000),
c04 varchar2(2000),
c05 varchar2(2000),
c06	varchar2(2000),
c07 varchar2(2000),
c08 varchar2(2000),
c09 varchar2(2000),
c10 varchar2(2000),
c11 varchar2(2000),
c12 varchar2(2000),
c13 varchar2(2000),
c14 varchar2(2000),
c15 varchar2(2000),
c16 varchar2(2000),
c17 varchar2(2000),
c18 varchar2(2000),    
c19 varchar2(2000),
c20 varchar2(2000)
)
/



declare 
 url_update varchar2(2000) := '&url_state';
begin
  for y in 2013 .. 2016 loop
     
     execute immediate 'drop table loaddata';
     
    dbms_output.put_line(url_update);
   DBMS_CLOUD.CREATE_EXTERNAL_TABLE (
	table_name => 'loaddata',
	credential_name =>'med_user_creds',	
	file_uri_list =>url_update||y||'.csv',	
	column_list => 'c01 varchar2(2000),
                    c02 varchar2(2000),    
                    c03 varchar2(2000),
                    c04 varchar2(2000),
                    c05 varchar2(2000),
                    c06	varchar2(2000),
                    c07 varchar2(2000),
                    c08 varchar2(2000),
                    c09 varchar2(2000),
                    c10 varchar2(2000),
                    c11 varchar2(2000),
                    c12 varchar2(2000),
                    c13 varchar2(2000),
                    c14 varchar2(2000),
                    c15 varchar2(2000),
                    c16 varchar2(2000),
                    c17 varchar2(2000),
                    c18 varchar2(2000),    
                    c19 varchar2(2000),
                    c20 varchar2(2000)',
	format => json_object( 'delimiter' value ',', 
      'ignoremissingcolumns' value 'true',
      'removequotes' value 'true',
                             'blankasnull' value 'true',
                             'skipheaders' value '1' ));
  
    insert into STATE_PRESCRIBER_DATA (
        State_Name,
        Drug_Name,
        Generic_Name,
        No_of_Prescribers,
        No_of_Medicare_Part_D_Claims, 
        No_of_Standardized_30_Day_Part_D_Fills, 
        Aggregate_Cost_Paid_for_Part_D_Claims,
        Number_of_Medicare_Beneficiaries,
        GE65_Suppression_Flag,
        Number_of_Medicare_Part_D_Claims_for_Beneficiaries_65, 
        Number_of_Standardized_30_Day_Part_D_Fills_for_Beneficiaries_65,
        Aggregate_Cost_Paid_for_Part_D_Claims_for_Beneficiaries_65,
        Beneficiary_65_Suppression_Flag,
        Number_of_Medicare_Beneficiaries_65,
        Aggregate_Cost_Share_for_Beneficiaries_with_Low_Income_Subsidy,
        Aggregate_Cost_Share_for_Beneficiaries_with_No_Low_Income_Subsidy,
        Opioid_Drug_Flag,
        Long_Acting_Opioid_Drug_Flag,
        Antibiotic_Drug_Flag,
        Antipsychotic_Drug_Flag, 
        RX_YEAR) select
            c01 ,
            c02 ,    
            translate (c03, '*#$%^()', '0000000') ,
            translate (c04, '*#$%^()', '0000000') ,
            translate (c05, '*#$%^()', '0000000') ,
            translate (c06, '*#$%^()', '0000000') ,
            translate (c07, '*#$%^()', '0000000') , 
            c08 ,
            translate (c09, '*#$%^()', '0000000') , 
            translate (c10, '*#$%^()', '0000000') , 
            translate (c11, '*#$%^()', '0000000') , 
            translate (c12, '*#$%^()', '0000000') , 
            translate (c13, '*#$%^()', '0000000') , 
            translate (c14, '*#$%^()', '0000000') , 
            translate (c15, '*#$%^()', '0000000') , 
            c16 ,
            c17 ,
            c18 ,    
            c19 , 
            c20 , y from loaddata;
            
  end loop;
  commit;
end;
/

select rx_year, count(*) from STATE_PRESCRIBER_DATA group by RX_year;

spool off
exit