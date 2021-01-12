#!/bin/bash
rm -r archive-data
mkdir archive-data
find $1 -type f ! -newermt "$2" -exec cp "{}" archive-data \;
