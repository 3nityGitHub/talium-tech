#!/bin/bash
mkdir -p ~/talium-tech/database/reports
cd ~/talium-tech/database/reports
for i in {1..10}; do
	echo "patients report $i - $(date)" > patients_$i.txt
done
ls
