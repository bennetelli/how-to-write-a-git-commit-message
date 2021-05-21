#!/bin/bash

# this script simplifies writing git commit messages. 
# Its based on this great blogpost: https://chris.beams.io/posts/git-commit/

echo Summarize the change:
read subject

echo ""
echo JIRA issue:
read jira

echo ""
echo Describe what this commit changes, why and how:
read body

# TODO 2. Limit the subject line to 50 characters

# 3. Capitalize the subject line
subject="${subject^}"

# 4. Do not end the subject line with a period
if [[ "$subject" == *. ]]
then
    subject="${subject%?}"
fi

# TODO 6. Wrap the body at 72 characters

if [ -z "$jira" ]
then
      git commit -m "$subject" -m "$body"
else
      git commit -m "$jira $subject" -m "$body"
fi 
