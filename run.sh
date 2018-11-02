#!/bin/bash

if [ $# -eq 1 ]
then

	zcat /data/NPMvulnerabilities/NPMpkglist/NPMpkglist_11.gz | python3 readNpm.py
	echo -e "Finished step #1!"
	python3 extrNpm.py dbarry > dbarry_urls
	echo -e "Finished step #2!"
	cat dbarry_urls | python3 readGit.py dbarry9 $1
	echo -e "Finished step #3!"
	python3 extrRels.py dbarry > dbarry_rels
	echo -e "Finished step #4!"
	cat dbarry_rels | python3 compareRels.py dbarry9 $1 > dbarry_rels.cmp
	echo -e "Finished step #5!"

else
	echo -e "USAGE: ./run.sh <GH password>"
fi
