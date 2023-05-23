#!/bin/bash
if [[ $# -lt 1 ]]
then
    echo "Not enough arguments. The programm terminated with an error"
    exit 1
elif [[ $# -gt 1 ]]
then
    echo "Too much arguments. The programm terminated with an error"
    exit 1
fi

echo "Enter the file names in this order:"
echo "'The file in which you want to search for the specified word' 'Space' 'The output file with the number of lines having the specified word'"

read input_file output_file

if [[ ! -n $input_file || ! -n $output_file ]]
then
    echo "Arguments $input_file and $output_file or one of this arguments do not exist. Thetprogramm terminated with an error"
    exit 2
fi

if [[ ! -f $input_file || ! -f $output_file ]]
then
    echo "Arguments $input_file and $output_file or one of this arguments aren't file. The programm terminated with an error"
    exit 2
fi

count=$(grep -c "$1" "$input_file")
#echo "$count" > "$output_file"
#A slightly improved version. More convenient if the user needs to find more than 1 word
dt=$(date)
echo "$dt: A word $1 encountered $count times in file $input_file" >> $output_file
echo "The programm was completed successfully"