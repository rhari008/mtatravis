#!/bin/bash

set -e

wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | sudo apt-key add -

# CF CLI installation

echo "deb http://packages.cloudfoundry.org/debian stable main" | sudo tee /etc/apt/sources.list.d/cloudfoundry-cli.list
echo "********* Installation of Cloud Foundry Command Line Interfece begins *********"
sudo apt-get update
sudo apt-get install cf-cli
echo "********* Installation of Cloud Foundry Command Line Interface completed *********"


# SAP MTAR Builder installation - Check SAP Cloud Tools for latest build - https://tools.hana.ondemand.com/additional/mta_archive_builder-1.1.0.jar 

ls 

echo "Java version"

java -version

echo "********* MTA Archive builder downloaded *********"

java -jar mta_archive_builder-1.1.0.jar --build-target=CF --mtar=samplehtml.mtar build

vi /home/travis/.npm/_logs/2018-06-21T04_45_38_844Z-debug.log