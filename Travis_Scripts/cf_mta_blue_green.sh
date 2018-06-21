#!/bin/bash
set -e
set -o pipefail
set -x

# Change the name of the Module temporary
BLUE=$1
GREEN="${BLUE}-B"
sudo sed -i -e "s/: ${BLUE}/: ${GREEN}/g" UI5Module/package.json
sudo ./Travis_Scripts/cf_mta_deploy