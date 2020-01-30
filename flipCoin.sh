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
		for j in `seq 1 $coins`
       		do
              		if [ $((RANDOM%2)) == 1 ]
              		then
                      	       	str=$str"H"
              		else
                       	       	str=$str"T"
              		fi
               	done
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

winningCombination()
{
	for i in ${!flipCoin[@]}
	do
		echo $i ${flipCoin["$i"]}
	done | sort -k2 -rn | head -n 1
}

choice="y"
while [ "$choice" == "y" ] || [ "$choice" == "Y" ] 
do
	read -p "Number of Flips: " flips
	read -p "Number of Coins:" coins
	isEmpty
	case $coins in
		1)
			outcome
			echo "${!flipCoin[@]}"
			echo "${flipCoin[@]}"
			percentage
			echo "${flipCoin[@]}"	
			winningCombination
			;;
		2)
			outcome
			echo "${!flipCoin[@]}"	
			echo "${flipCoin[@]}"	
			percentage
			echo "${flipCoin[@]}"			
			winningCombination		
			;;
		3)
			outcome
			echo "${!flipCoin[@]}"	
			echo "${flipCoin[@]}"	
			percentage
			echo "${flipCoin[@]}"
			winningCombination		
			;;
		*)
			echo "Error"
	esac
	read -p "Do you want to continue [y/n]: " choice
done
