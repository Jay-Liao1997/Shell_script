#!/bin/bash
#/**********************************************************
# * Author        : Jay-L
# * Email         : 1046250579@126.com
# * Last modified : 2020-07-21 20:38
# * Filename      : test_file.sh
# * Description   : Testing file;if existing,print yes;otherwise, no 
# * *******************************************************/

read -p "Please keyin a filename which you want to check:" filename
test -e ${filename} && echo  "yes" || echo "no"

