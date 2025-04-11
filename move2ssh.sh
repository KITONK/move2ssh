#!/bin/bash

# Define colors
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
NC=$(tput sgr0) # Reset color

# Define the path to the .ssh folder
SSH_DIR="$HOME/.ssh"

# Function to display help message
show_help() {
  echo "${BLUE}Usage: $(basename "$0") [source_folder] [options]${NC}"
  echo "${YELLOW}Options:${NC}"
  echo "  --h, --help     Show this help message"
  echo "  --l, --list     List all directories inside .ssh"
  echo "  --m, --move     Move existing files to a new folder before copying from source folder"
  echo "  --b, --backup   Create a backup of current .ssh files before replacing them"
}

# Check if any argument is --h or --help
if [[ " $* " =~ " --h " ]] || [[ " $* " =~ " --help " ]]; then
  show_help
  exit 0
fi

# Check if any argument is --l or --list
if [[ " $* " =~ " --l " ]] || [[ " $* " =~ " --list " ]]; then
  echo "${BLUE}Available .ssh directories:${NC}"
  find "$SSH_DIR" -mindepth 1 -maxdepth 1 -type d -exec basename {} \;
  exit 0
fi

# Check if the .ssh folder exists
if [ ! -d "$SSH_DIR" ]; then
  echo "${RED}The .ssh folder does not exist!${NC}"
  echo "${YELLOW}Creating .ssh directory with proper permissions...${NC}"
  mkdir -p "$SSH_DIR"
  chmod 700 "$SSH_DIR"
fi

# Check if source folder argument is provided
if [ -z "$1" ] || [[ "$1" == --* ]]; then
  echo "${RED}Source folder for copying files is not specified. Use --h or --help for usage.${NC}"
  exit 1
fi

# Define the path to the source folder
SOURCE_DIR="$SSH_DIR/$1"
SOURCE_DIR=$(readlink -f "$SOURCE_DIR")

# Check if the source folder exists
if [ ! -d "$SOURCE_DIR" ]; then
  echo "${RED}The source folder '$SOURCE_DIR' does not exist!${NC}"
  exit 1
fi

# Create backup if requested
if [[ " $* " =~ " --b " ]] || [[ " $* " =~ " --backup " ]]; then
  BACKUP_DIR="$SSH_DIR/backup-$(date +%Y%m%d%H%M%S)"
  mkdir -p "$BACKUP_DIR"
  find "$SSH_DIR" -maxdepth 1 -type f -exec cp {} "$BACKUP_DIR" \;
  echo "${GREEN}Backup created at $BACKUP_DIR${NC}"
fi

# Check for the --m or --move flag (move files before copying)
if [[ " $* " =~ " --m " ]] || [[ " $* " =~ " --move " ]]; then
  while true; do
    read -p "Enter a name for the new folder (or press Enter to use default): " CUSTOM_DIR_NAME
    
    # Use user-defined folder name or generate default one
    if [ -z "$CUSTOM_DIR_NAME" ]; then
      NEW_DIR="$SSH_DIR/old-config-$(date +%Y%m%d%H%M%S)"
      break
    else
      NEW_DIR="$SSH_DIR/$CUSTOM_DIR_NAME"
      
      # Check if folder already exists
      if [ -d "$NEW_DIR" ]; then
        echo "${YELLOW}Folder '$CUSTOM_DIR_NAME' already exists. Please choose another name.${NC}"
      else
        break
      fi
    fi
  done

  mkdir -p "$NEW_DIR"
  echo "${GREEN}Created new directory $NEW_DIR${NC}"

  # Move existing files to the new directory
  find "$SSH_DIR" -maxdepth 1 -type f -exec mv {} "$NEW_DIR" \;
  echo "${GREEN}Files have been moved to $NEW_DIR and .ssh is now empty.${NC}"

  # Copy files from source directory
  find "$SOURCE_DIR" -maxdepth 1 -type f -exec cp {} "$SSH_DIR" \;
  echo "${GREEN}Files from the folder $SOURCE_DIR have been successfully copied to .ssh${NC}"
  
  # Set proper permissions for SSH files
  chmod 600 "$SSH_DIR"/*
  chmod 644 "$SSH_DIR"/*.pub 2>/dev/null || true
else
  # Remove existing files and copy from source
  echo "${YELLOW}Removing existing files in .ssh directory...${NC}"
  find "$SSH_DIR" -maxdepth 1 -type f -exec rm -f {} \;
  
  # Copy files from source directory
  find "$SOURCE_DIR" -maxdepth 1 -type f -exec cp {} "$SSH_DIR" \;
  echo "${GREEN}Files from the folder $SOURCE_DIR have been successfully copied to .ssh${NC}"
  
  # Set proper permissions for SSH files
  chmod 600 "$SSH_DIR"/*
  chmod 644 "$SSH_DIR"/*.pub 2>/dev/null || true
fi

echo "${GREEN}Operation completed successfully!${NC}"
