#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Usage: gitap.sh file_now file_then msg"
    exit 1
fi

echo "Adding file $1 to repo"

echo cp $1 $2
echo git add $2
echo git commit -m "$3"

formatted_date=`date -r $1 "+%Y-%m-%d %H:%M:%S %z"`

echo GIT_COMMITTER_DATE="$formatted_date" git commit --amend --no-edit --date="$formatted_date"