#!/bin/bash
set -e
set -o pipefail
set -x

if [ 1 eq 0 ]; then
    #MTA Builder

    echo "********* MTA Archive builder downloaded *********"

    java -jar lib/mta_archive_builder-1.1.0.jar --build-target=CF --mtar=samplehtml.mtar build

    echo "********* MTA Build done *********"

    echo "********* Ready to perform deployment *********"

    #CF Deploy the built MTAR file

    sudo cf deploy samplehtml.mtar

fi
