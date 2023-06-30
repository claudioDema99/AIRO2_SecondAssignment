#!/bin/bash

# Every command that fails will cause the script to terminate
set -e

# Storing the main project location
MAIN_DIR=$(pwd)

# Defining some useful variables
GREEN='\033[0;32m' 
UGREEN='\033[4;32m' 
RESET='\033[0m'

# Removes any existing build files
rm -f -r ./visits_module/build

# Builds the external module
cd ./visits_module/src
./buildInstruction.txt

printf "\n${GREEN}Build completed!\n\n"

# Returning to the main project directory
cd "$MAIN_DIR"

exit
