#!/bin/bash
set -e
set -o pipefail
set -x

# Change the name of the Module temporary
BLUE=$1
GREEN="${BLUE}-B"
sudo sed -i -e "s/: ${BLUE}/: ${GREEN}/g" UI5Module/package.json


# Get path to script directory: http://stackoverflow.com/a/4774063
pushd `dirname $0` > /dev/null
SCRIPTPATH=`pwd`
popd > /dev/null

sudo $SCRIPTPATH/cf_mta_deploy.sh