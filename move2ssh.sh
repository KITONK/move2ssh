#!/bin/bash

# Define the path to the .ssh folder
SSH_DIR="$HOME/.ssh"

# Check if any argument is -help
if [[ " $* " =~ " -help " ]]; then
  echo "Usage: script.sh [source_folder] [-m]"
  echo "Options:"
  echo "  -help     Show this help message"
  echo "  -list     List all directories inside .ssh"
  echo "  -m        Move files to a new folder and copy from source folder"
  exit 0
fi

# Check if any argument is -list
if [[ " $* " =~ " -list " ]]; then
  echo "Available .ssh directories:"
  find "$SSH_DIR" -mindepth 1 -maxdepth 1 -type d -exec basename {} \;
  exit 0
fi

# Check if the .ssh folder exists
if [ ! -d "$SSH_DIR" ]; then
  echo "The .ssh folder does not exist!"
  exit 1
fi

# Check if source folder argument is provided
if [ -z "$1" ]; then
  echo "Source folder for copying files is not specified. Use -help for usage."
  exit 1
fi

# Define the path to the source folder
SOURCE_DIR="$SSH_DIR/$1"
SOURCE_DIR=$(readlink -f "$SOURCE_DIR")

# Check if the source folder exists
if [ ! -d "$SOURCE_DIR" ]; then
  echo "The source folder does not exist!"
  exit 1
fi

# Check for the -m flag (move files before copying)
if [[ " $* " =~ " -m " ]]; then
  while true; do
    read -p "Enter a name for the new folder (or press Enter to use default): " CUSTOM_DIR_NAME
    
    # Use user-defined folder name or generate default one
    if [ -z "$CUSTOM_DIR_NAME" ]; then
      NEW_DIR="$SSH_DIR/new-folder-$(date +%Y%m%d%H%M%S)"
      break
    else
      NEW_DIR="$SSH_DIR/$CUSTOM_DIR_NAME"
      
      # Check if folder already exists
      if [ -d "$NEW_DIR" ]; then
        echo "Folder '$CUSTOM_DIR_NAME' already exists. Please choose another name."
      else
        break
      fi
    fi
  done

  mkdir "$NEW_DIR"
  echo "Created new directory $NEW_DIR"

  find "$SSH_DIR" -maxdepth 1 -type f -exec mv {} "$NEW_DIR" \;
  echo "Files have been moved to $NEW_DIR and .ssh is now empty."

  find "$SOURCE_DIR" -maxdepth 1 -type f -exec cp {} "$SSH_DIR" \;
  echo "Files from the folder $SOURCE_DIR have been successfully copied to .ssh"
else
  find "$SSH_DIR" -maxdepth 1 -type f -exec rm -f {} \;
  find "$SOURCE_DIR" -maxdepth 1 -type f -exec cp {} "$SSH_DIR" \;
  echo "Files from the folder $SOURCE_DIR have been successfully copied to .ssh"
fi
