#Madelaine Struwe
#Josh Nguyen

#!/bin/bash
#cat, concatenate, make file, view contents of fie and 
#redirect output in terminal or other files
#-F field spearator, in this case space
#prints in format: avg [ID] last, first
cat $1 | awk -F' ' '{ print ($4 + $5 + $6)/3 " " "["$1"]" " " $3", "$2 }'>UnsortStudentGrades.txt
#the spaces are important above because that is what is being used
#as an internal field seperator
#sort by last name, then first name
sort -k3 -k4 UnsortStudentGrades.txt