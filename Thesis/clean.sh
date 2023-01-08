#!/bin/bash
### 
# @file clean.sh
# @brief 
# 	- Use Bash under Unix OS
# 	- Remove LaTeX Build Files
# 	- Use `posix-egrep' Standard regex 
# @author Christopher Liu
# @version 1.0
# @date 2023-01-06
#/

### Use latexmk -> Don't remove bbl|thm
latexmk -c tjumain && exit

### manually clean up
echo "- latexmk not callable, Start Cleaning Build Files Manually"
files=`find . \
	-regextype 'posix-egrep' \
	-regex ".*\.(aux|log|out|thm|toc|bbl|blg|fdb_latexmk|fls|gz)"`

[[ "$files" == "" ]] \
&& echo "- Build Files NOT Found" \
&& exit

for i in ${files} 
do 
	rm $i
	echo "    - Found and Remove $i"
done 
echo "- Cleaning Build Files End"

