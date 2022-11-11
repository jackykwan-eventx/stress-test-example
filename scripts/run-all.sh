#! /bin/bash

report_dir="output/reports"
json_dir="output/jsons"

# create dir for reports & jsons
mkdir -p $report_dir
mkdir -p $json_dir

for scenarioFile in `ls scenarios/*.yml` ; do
  # var fileName= basename $scenarioFile
  fileName=$(basename $scenarioFile)
  yarn artillery run --config common-config.yml $scenarioFile -o $json_dir/$fileName.json
  yarn artillery report $json_dir/$fileName.json -o $report_dir/$fileName.html
done