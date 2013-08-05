#!/bin/bash

touch ~/temp/repos.txt
touch ~/temp/project.json

#define var
reposfile=~/temp/repos.txt
jsonfile=~/temp/project.json
gitolitefile=~/temp/gitolite.conf
domain=yourdomain.com

grep repo $gitolitefile | awk '{print $2}' > $reposfile
echo "{" > $jsonfile
while read -r line
do
    echo "\"$line\":\"git@$domain:$line\"," >> $jsonfile
done < $reposfile
echo "}" >> $jsonfile
