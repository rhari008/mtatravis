#CF Deploy the built MTAR file

#!/bin/bash
set -e

set -x

# SAP MTAR Builder installation - Check SAP Cloud Tools for latest build - https://tools.hana.ondemand.com/additional/mta_archive_builder-1.1.0.jar 

echo "********* MTA Archive builder downloaded *********"

java -jar ../lib/mta_archive_builder-1.1.0.jar --build-target=CF --mtar=samplehtml.mtar build

echo "********* MTA Build done *********"

echo "********* Ready to perform deployment *********"

sudo cf deploy samplehtml.mtar
