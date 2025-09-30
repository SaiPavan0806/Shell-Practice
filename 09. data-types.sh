#!/bin/bash

#Everything in shell is considered as string
NUMBER1=100
NUMBER2=600

SUM=$(($NUMBER1+$NUMBER2))

echo "SUM is: ${SUM}"

LEADERS=("Suray" "Williamson" "Cummins")

#shows us all the values in the above instance and we should use "@"
echo "All leaders: ${LEADERS[@]}"
# If we want to only know the first value we should mark it as "0"
echo "First leader: ${LEADERS[0]}"