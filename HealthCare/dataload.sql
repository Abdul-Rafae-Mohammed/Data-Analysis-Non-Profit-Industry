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

define url_national  = 'https://swiftobjectstorage.&3..oraclecloud.com/v1/&4/&5/*-national-summary-report-calendar-year*'
define url_state = 'https://swiftobjectstorage.&3..oraclecloud.com/v1/&4/&5/*-state-summary-report-calendar-year*'


-- Load Data 

BEGIN
  delete from national_prescriber_data;
  commit;
 for i in 2013 .. 2016 loop
   DBMS_CLOUD.COPY_DATA(
      table_name =>'national_prescriber_data',
      credential_name =>'med_user_creds',
      file_uri_list =>'&url_national',
      field_list => '
        DRUG_NAME                                                           char(2000),
        GENERIC_NAME                                                        char(2000),
        NO_OF_PRESCRIBERS                                                   float,
        NO_OF_MEDICARE_PART_D_CLAIMS                                        float,
        NO_OF_STANDARDIZED_30_DAY_PART_D_FILLS                              float,
        AGGREGATE_COST_PAID_FOR_PART_D_CLAIMS                               float,
        NUMBER_OF_MEDICARE_BENEFICIARIES                                    float,
        GE65_SUPPRESSION_FLAG                                               char(2000),
        NUMBER_OF_MEDICARE_PART_D_CLAIMS_FOR_BENEFICIARIES_65               float,
        NUMBER_OF_STANDARDIZED_30_DAY_PART_D_FILLS_FOR_BENEFICIARIES_65     float,
        AGGREGATE_COST_PAID_FOR_PART_D_CLAIMS_FOR_BENEFICIARIES_65          float,
        BENEFICIARY_65_SUPPRESSION_FLAG                                     float,
        NUMBER_OF_MEDICARE_BENEFICIARIES_65                                 float,
        AGGREGATE_COST_SHARE_FOR_BENEFICIARIES_WITH_LOW_INCOME_SUBSIDY      float,
        AGGREGATE_COST_SHARE_FOR_BENEFICIARIES_WITH_NO_LOW_INCOME_SUBSIDY   float,
        OPIOID_DRUG_FLAG                                                    char(2000),
        LONG_ACTING_OPIOID_DRUG_FLAG                                        char(2000),
        ANTIBIOTIC_DRUG_FLAG                                                char(2000),
        ANTIPSYCHOTIC_DRUG_FLAG                                             char(2000),
        RX_YEAR                                                             float',  
      format => json_object( 'delimiter' value ',', 
      'ignoremissingcolumns' value 'true',
      'removequotes' value 'true',
                             'blankasnull' value 'true',
                             'skipheaders' value '1' )
    );
    update national_prescriber_data set rx_year = i where rx_year is null;
    commit;
  end loop;
END;
/


BEGIN
  delete from state_prescriber_data;
  commit;
 for i in 2013 .. 2016 loop
   DBMS_CLOUD.COPY_DATA(
      table_name =>'state_prescriber_data',
      credential_name =>'med_user_creds',
      file_uri_list =>'&url_state',
      field_list => '
        State_Name                                                          char(2000),
        DRUG_NAME                                                           char(2000),
        GENERIC_NAME                                                        char(2000),
        NO_OF_PRESCRIBERS                                                   float,
        NO_OF_MEDICARE_PART_D_CLAIMS                                        float,
        NO_OF_STANDARDIZED_30_DAY_PART_D_FILLS                              float,
        AGGREGATE_COST_PAID_FOR_PART_D_CLAIMS                               float,
        NUMBER_OF_MEDICARE_BENEFICIARIES                                    float,
        GE65_SUPPRESSION_FLAG                                               char(2000),
        NUMBER_OF_MEDICARE_PART_D_CLAIMS_FOR_BENEFICIARIES_65               float,
        NUMBER_OF_STANDARDIZED_30_DAY_PART_D_FILLS_FOR_BENEFICIARIES_65     float,
        AGGREGATE_COST_PAID_FOR_PART_D_CLAIMS_FOR_BENEFICIARIES_65          float,
        BENEFICIARY_65_SUPPRESSION_FLAG                                     float,
        NUMBER_OF_MEDICARE_BENEFICIARIES_65                                 float,
        AGGREGATE_COST_SHARE_FOR_BENEFICIARIES_WITH_LOW_INCOME_SUBSIDY      float,
        AGGREGATE_COST_SHARE_FOR_BENEFICIARIES_WITH_NO_LOW_INCOME_SUBSIDY   float,
        OPIOID_DRUG_FLAG                                                    char(2000),
        LONG_ACTING_OPIOID_DRUG_FLAG                                        char(2000),
        ANTIBIOTIC_DRUG_FLAG                                                char(2000),
        ANTIPSYCHOTIC_DRUG_FLAG                                             char(2000),
        RX_YEAR                                                             float',    
      format => json_object( 'delimiter' value ',', 
      'ignoremissingcolumns' value 'true',
      'removequotes' value 'true',
                             'blankasnull' value 'true',
                             'skipheaders' value '1' )
    );
    update state_prescriber_data set rx_year = i where rx_year is null;
    commit;
  end loop;
END;
/

spool off
exit