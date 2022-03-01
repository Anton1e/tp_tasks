#!/usr/bin/env bash

# make backup archive with the backup folder
make_archive () {
    mkdir ./$2
    mkdir ./$2/$1
}

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
            backup $file $2 $3 $4
        else
            case $file in
                *.$2) 
                    cp $file ./$4/$3
                    ;;
            esac
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

make_archive $backup_folder $backup_archive_name
backup $input_folder $extension $backup_folder $backup_archive_name

echo "done"
