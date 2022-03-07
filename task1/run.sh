#!/bin/bash 

# DOCUMENTATION
# script takes in 8 arguments:
#--input_folder INPUT_FOLDER --extension EXTENSION --backup_folder BACKUP_FOLDER --backup_archive_name BACKUP_ARCHIVE_NAME in random order
# it takes all files in INPUT_FOLDER and its directories with 
# EXTENSION and copies them all to BACKUP_FOLDER. Then an archive with 
# BACKUP_ARCHIVE_NAME is made from the BACKUP_FOLDER

# backup (input_folder, extension, backup_folder)
# use find to get all files with needed extension in 
# input_folder and its directories
# copy them to backup_folder and change thier names into
# {counter}_FILE_NAME
backup () {
    find $1 -name "*.$2" -exec cp --backup=t {} ./$3 \;
}


# reading input
# declaring dict with input information
declare -A input=( ["$1"]="$2" ["$3"]="$4" ["$5"]="$6" ["$7"]="$8" )
input_folder=${input["--input_folder"]}
extension=${input["--extension"]}
backup_folder=${input["--backup_folder"]}
backup_archive_name=${input["--backup_archive_name"]}

#backup to backup_folder and make an archive from it
mkdir ./$backup_folder
backup $input_folder $extension $backup_folder
tar -czf $backup_archive_name $backup_folder

echo "done"
