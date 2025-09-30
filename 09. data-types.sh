#!/bin/bash

#Everything in shell is considered as string
NUMBER1=100
NUMBER2=600

sleep 5
SUM=$(($NUMBER1+$NUMBER2))

echo "SUM is: ${SUM}"

LEADERS=("Surya" "Williamson" "Cummins" "Raina")

#shows us all the values in the above instance and we should use "@"
echo "All leaders: ${LEADERS[@]}"
# If we want to only know the first value we should mark it as "0"
echo "First leader: ${LEADERS[0]}"