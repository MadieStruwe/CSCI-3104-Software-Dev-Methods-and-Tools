#Madelaine Struwe
#Josh Nguyen

#!/bin/bash
#file format: studens ID, first name, last name, and 3 grades
input=$1
#for now, im just setting the average of the grades to 0
avg=0
#remove UnsortStudentGrades.txt before doing stuff with here
#i got tired of deleating it every time i re-ran this
rm UnsortStudentGrades.txt
#IFS=internal field separator, with this file it is a space
#while the field separator is a space, read while using "raw input"
#col-num- are the 6 different columns in the txt file
while read -r col1 col2 col3 col4 col5 col6;
#now to do some stuff... let us find the avgs of the students grades
do 
#imma use expr to do the math-y part of the avgs, since expr is used
#to evaluate arguments as expresssions
avg=$(expr $col4 + $col5 + $col6)
avg=$(expr $avg / 3)
#and put that info into a new file, the UnsortStudentGrades.txt
echo "$avg" ["$col1"] "$col3", "$col2">>UnsortStudentGrades.txt
done < "$input"
#-k sort by key, so i can sort by their last names then first
sort -k3 -k4 < UnsortStudentGrades.txt