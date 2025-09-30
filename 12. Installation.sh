#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0]; then
    echo "ERROR: Please run this script with root privelege"
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR: Installing MySQL is FAILURE"
else
    echo "Installing MySQl is SUCCESS"
fi