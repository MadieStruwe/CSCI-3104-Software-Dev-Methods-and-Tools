#Madelaine Struwe
#Josh Nguyen

#!/bin/bash
#lines ending with numbers
egrep '[0-9]$' $1 | wc -l
#lines that do not start with a vowel
#i am NOT including y as a vowel
egrep '^[^aeiouAEIOU]' $1 | wc -l
#12 letter lines
egrep '^[a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z]$' $1 | wc -l
#number of phone numbers _ _ _ - _ _ _ - _ _ _ _
egrep '^[0-9][0-9][0-9]\-[0-9][0-9][0-9]\-[0-9][0-9][0-9][0-9]$' $1 | wc -l
#city of boulder numbers (same as above, but start with 303)
egrep '^303\-[0-9][0-9][0-9]\-[0-9][0-9][0-9][0-9]$' $1 | wc -l
#begine with vowel, end with number
egrep '^[aeiouAEIOU].*[0-9]$' $1 | wc -l
#email addresses from geocities.com
egrep '^.+\@[geocities]+\.com$' $1 | wc -l
#email adrress format first.last, and first name starts with letter in
#first half a-m of alphabet 
egrep '^[a-mA-M][a-zA-Z]*\.[a-zA-Z]*\@[a-zA-Z]+....$' $1 | wc -l