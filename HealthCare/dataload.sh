#title           :import1.sh
#description     :This script will enable you to import data from Object Storage into your ATP/ADW instance.
#author		 :Phani Turlapati	
#date            :20181025
#version         :0.1    
#usage		 :./import1.sh
#bash_version    :4.1.5(1)-release
#==============================================================================


echo "Starting data-loading Script"
echo "Please fill details for easy-loading"

read -p "Enter Tenancy Name :" tenancy_name
read -p "Enter Bucket Name :" bucket_name 
read -p "Enter Source dir consisting of data file to be loaded :" src_dir
read -s -p "Enter ADB password :" db_passwd
read -p "Enter ADB service name :" db_service
read -p "Enter Wallet File Location:" db_wallet
export TNS_ADMIN=${db_wallet}
to_be_replaced="\"?/network/admin\""
replacement_string="\${TNS_ADMIN}"
replacement_file=${db_wallet}/sqlnet.ora
echo $to_be_replaced
echo $replacement_string
echo $replacement_file

echo "Starting Uploading of Files process"
echo "==================================="
oci os object bulk-upload --bucket-name ${bucket_name} --src-dir ${src_dir} 
echo "==================================="

echo "Setting Wallet file to access Database"
sed -i '' 's#\"?/network/admin\"#${TNS_ADMIN}#g' ${db_wallet}/sqlnet.ora 

read -p "Enter Tenancy Region :" tenancy_region
read -p "Enter username to create cloud user credentials :" db_user
read -s -p "Enter Auth Token for the cloud user :" db_auth_token
echo "Connecting to Database...."
sqlplus admin/${db_passwd}@${db_service} @dataload.sql ${db_user} ${db_auth_token} ${tenancy_region} ${tenancy_name} ${bucket_name} ${db_service}


# d_files="" 

# for sc_name in $@
# do
#   echo 'Schema Name > ' ${sc_name}
#   if [ "${d_files}" == "" ]; then
#     d_files=default_credential:https://swiftobjectstorage.<REGION_NAME>.oraclecloud.com/v1/metroauto/DATA/${sc_name}.dmp
#   else
#     d_files=${d_files},default_credential:https://swiftobjectstorage.<REGION_NAME>.oraclecloud.com/v1/metroauto/DATA/${sc_name}.dmp
#   fi
# done
# 
# echo ${d_files}
# 
# impdp admin/@regprod_high parallel=4 directory=data_pump_dir \
# dumpfile=${d_files} content=data_only  transform=segment_attributes:n exclude=cluster, db_link