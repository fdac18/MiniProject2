#!/bin/bash
#Just so I remember to access any project the url would be https://sourceforge.net/projects/project_name
#And this is the link for API https://sourceforge.net/p/forge/documentation/Allura%20API/#project-export

rm SourceforgeXprojects.txt
rm SourceforgeXprojectsExist.txt
filename="SourceforgeXprojects.txt"

i=0
page=1
while [ $i -lt 50 ]
do
	curl -s "https://sourceforge.net/directory/os%3Alinux/?page=$page" | grep -o "\/projects\/x[a-zA-Z0-9]*" | sort -u > SourceforgeXprojects.txt
	page=$[$page+1]

	sed -i 's/\/projects\///g' SourceforgeXprojects.txt

	while read -r line
	do
		res=$(curl -s "https://sourceforge.net/projects/$line" | grep "Whoops")
		if [ "$res" == '' ]
		then
			echo $line >> "SourceforgeXprojectsExist.txt"
		fi
	done < "$filename"
	i=$(cat SourceforgeXprojectsExist.txt | sort -u | wc -l)
	
done
