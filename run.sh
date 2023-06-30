#!/bin/bash

# Every command that fails will cause the script to terminate
set -e

# Defining some useful variables
GREEN='\033[0;32m' 
UGREEN='\033[4;32m' 
RESET='\033[0m'

# Default (yes/no) hint formatting
GREEN_YES_NO="${RESET}${GREEN}(${UGREEN}y${GREEN}es/${UGREEN}n${GREEN}o)${RESET}"

# Default POPF path
POPF=./popf3-clp

DOMAIN=./visits_domain
EXTERNAL=./visits_module/build

# Execute the planner
$POPF -x $DOMAIN/dom1.pddl $DOMAIN/prob1.pddl $EXTERNAL/libVisits.so $DOMAIN/region_poses

exit
