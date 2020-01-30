#!/bin/bash
echo "Welcome to flip coin problem"

outcome()
{
	if [ $((RANDOM%2)) == 1 ]
        then
               	echo "Head"
        else
               	echo "Tail"
        fi
}
outcome
