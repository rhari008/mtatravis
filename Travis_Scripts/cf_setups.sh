#!/bin/bash

set -e

wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | sudo apt-key add -

# CF CLI installation

echo "deb http://packages.cloudfoundry.org/debian stable main" | sudo tee /etc/apt/sources.list.d/cloudfoundry-cli.list
echo "********* Installation of Cloud Foundry Command Line Interfece begins *********"
sudo apt-get update
sudo apt-get install cf-cli
echo "********* Installation of Cloud Foundry Command Line Interface completed *********"

# Install plugins

sudo cf install-plugin ./lib/mtaplugin.bin -f

sudo cf plugins

# CF login
sudo chmod 777 /home/travis/.cf/config.json  # Fix for the CF read

echo $CF_API 
echo $CF_ORG
echo $CF_SPACE
echo $CF_USERNAME
echo $CF_PASSWORD

sudo cf api $CF_API

sudo cf login -u $CF_USERNAME -p $CF_PASSWORD -o $CF_ORG -s $CF_SPACE

# CF deploy
# Get path to script directory: http://stackoverflow.com/a/4774063
pushd `dirname $0` > /dev/null
SCRIPTPATH=`pwd`
popd > /dev/null

sudo $SCRIPTPATH/cf_mta_deploy.sh

# CF Performing Blue green deployment
