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

# SAP MTAR Builder installation - Check SAP Cloud Tools for latest build - https://tools.hana.ondemand.com/additional/mta_archive_builder-1.1.0.jar 

echo "********* MTA Archive builder downloaded *********"

java -jar lib/mta_archive_builder-1.1.0.jar --build-target=CF --mtar=samplehtml.mtar build

echo "********* MTA Build done *********"

echo "********* Ready to perform deployment *********"

# CF login
cf api $CF_api
cf login -u $CF_USERNAME -p $CF_PASSWORD -o $CF_ORG -s $CF_SPACE

#CF Deploy the built MTAR file

cf deploy samplehtml.mtar

