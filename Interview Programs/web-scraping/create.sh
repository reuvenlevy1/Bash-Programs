#!/bin/sh

# Web Scraping from YouTube's Trending page
# The following pages are created:
# 1. titles.txt 		--> List of video titles
# 2. ids.txt  		  --> List of video ids
# 3. user.txt 		  --> List of video users
# 4. durations.txt	-->	List of video durations
# 5. views.txt		  -->	List of video views
# 6. table.csv		  --> List of everything above
#
# @author Reuven

#TITLE
grep aria-describedby index.html | while read x ; do
  title=`expr "$x" : ".*title=\"\(.*\)\" aria-describedby=.*"`
  echo ${title//,/} 									                    #Print what is displayed.
done > echo "TITLE" titles.txt 							              #Send printed results to titles.txt, which it will create.

#ID
grep data-ytid index.html | while read x ; do
  id=`expr "$x" : '.*data-ytid=\"\(.*\)\".*</a>'`
  echo ${id}
done > ids.txt

#USERS
grep aria-describedby index.html | while read x ; do 	    #grep to the same line that "aria-describedby" is on.
  user=`expr "$x" : ".* >\(.*\).*</a>"`
  echo ${user}
done > users.txt

#DURATION
grep Duration index.html | while read x ; do
  duration=`expr "$x" : ".*: \(.*\)\.<"`
  echo ${duration}
done > durations.txt

#VIEWS
grep views index.html | while read x ; do
  views=`expr "$x" : ".*<li>\(.*\)views"`
  echo ${views//,/} 									#// is a remove command; the comma is being removed; / ends command. We need to do this because the csv file will separate each line by commas.
done > views.txt

paste -d "," titles.txt ids.txt users.txt durations.txt views.txt > table.csv #Pastes using a comma as a delimeter the following .txt files into a table.csv (comma separated values) file.
