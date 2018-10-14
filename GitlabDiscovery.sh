#!/bin/bash
#Just so I remember to access any project the url would be https://gitlab.com/project_path
#And this is the link for API https://gitlab.com/explore/projects?non_archived=true&page=$page&sort=latest_activity_desc

rm GitlabXprojects.txt
rm GitlabXprojectsExist.txt
filename="GitlabXprojects.txt"

i=0
page=1
while [ $i -lt 50 ]
do
	curl -s "https://gitlab.com/explore/projects?non_archived=true&page=$page&sort=latest_activity_desc" \
		| grep "project-full-name" \
		| grep -o "href=\"\/[a-zA-Z0-9_-\.]*\/x[a-zA-Z0-9_-\.]*\"" > GitlabXprojects.txt
	page=$[$page+1]

	sed -i -e 's/href="//g' -e 's/"//g' GitlabXprojects.txt

	while read -r line
	do
		res=$(curl -s "https://gitlab.com/$line" | grep "is empty")
		if [ "$res" == '' ]
		then
			echo $line >> "GitlabXprojectsExist.txt"
		fi
	done < "$filename"

	i=$(cat GitlabXprojectsExist.txt | sort -u | wc -l)
done


