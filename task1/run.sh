#!/bin/bash 

#counter of backed up files
couter=0

# backup funtion (input_folder, extension, backup folder, backup archive)
# tranverse through directory recursively
# if file is a directory go into it
# else check if it has the needed extension
# if yes copy it otherwise pass
backup () {
    for file in $1/*
    do
        if [ -d $file ];
        then
            backup $file $2 $3
        else
            if [ ${file##*.} == $2 ];
            then
                file_name=$(basename -- $file)
                cp $file ./$3
                #rename file_name into 
                #FILE_NAME_{number of backed up files}.FILE_EXTENSION
                new_file_name="${file_name#*.}_$(( ++counter )).${file_name##*/}" 
                mv ./$3/$file_name ./$3/$new_file_name
            fi
        fi          
    done
}


# reading input
input=($1 $2 $3 $4 $5 $6 $7 $8)
for i in 0 2 4 6
do
    if [ ${input[i]} == "--input_folder" ];
    then 
        input_folder=${input[$(( i + 1 ))]}
    elif [ ${input[i]} == "--extension" ];
    then
        extension=${input[$(( i + 1 ))]}
    elif [ ${input[i]} == "--backup_folder" ];
    then 
        backup_folder=${input[$(( i + 1 ))]}
    else 
        backup_archive_name=${input[$(( i + 1 ))]}
    fi
done

#backup to backup_folder and make an archive from it
mkdir ./$backup_folder
backup $input_folder $extension $backup_folder
tar -czf $backup_archive_name $backup_folder

echo "done"
