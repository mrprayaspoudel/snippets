#!/bin/bash

# Function to list all folders and perform git pull inside each folder
git_pull_in_folders() {
    for dir in */; do
        if [ -d "$dir/.git" ]; then
            echo "Pulling in $dir ..."
            cd "$dir" || exit
            git pull
            cd ..
            echo "Pulling in $dir done"
            echo "========================"
        fi
    done
}

main() {
    echo "Listing all folders..."
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    ls -d */ | while read -r dir; do
        echo "Folder: $dir"
        echo "**************************"
    done

    echo "Performing git pull inside each folder..."
    git_pull_in_folders
    echo "++++++++++++++++++++++++++++++++++++++++++"
    echo "Git pull in all folders completed!"
}

main
