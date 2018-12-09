#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Usage: gitap.sh file_now file_then msg"
    exit 1
fi

echo "Adding file $1 to repo"

cp $1 $2
git add $2
git commit -m "$3"

formatted_date=`date -r $1 "+%Y-%m-%d %H:%M:%S %z"`

GIT_COMMITTER_DATE="$formatted_date" git commit --amend --no-edit --date="$formatted_date"