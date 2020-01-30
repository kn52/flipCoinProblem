#!/bin/bash
declare -A flipCoin
echo "Welcome to flip coin problem"
isEmpty()
{
	flipCoin=( )
}
dictionary()
{
	flipCoin[$str]=$((flipCoin[$str]+1))
}
outcome()
{
	for i in `seq 1 $flips`
	do
		str=""
              	if [ $((RANDOM%2)) == 1 ]
              	then
                      	       	str="H"
              	else
                       	       	str="T"
       		fi
       		dictionary
	done
}
percentage()
{
	for i in ${!flipCoin[@]}
	do
		val=${flipCoin[$i]}
		flipCoin[$i]=$( echo "scale=2; $val * 100 / $flips" | bc )
	done
}

read -p "Enter no of flips: " flips
isEmpty
outcome
echo "${!flipCoin[@]}"
echo "${flipCoin[@]}"
percentage	
echo "${flipCoin[@]}"
