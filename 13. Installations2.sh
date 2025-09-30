#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR: Please run this script with root privelege"
    exit 1 # failure is other than 0
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR: Installing MySQL is FAILURE"
    exit 1
else
    echo "Installing MySQl is SUCCESS"
fi

dnf install nginx -y

if [ $? -ne 0 ]; then
    echo "ERROR: Installing nginx is FAILURE"
    exit 1
else
    echo "Installing nginx is SUCCESS"
fi

dnf install mongodb-mongosh -y

if [ $? -ne 0 ]; then
    echo "ERROR: Installing mongodb-mongosh is FAILURE"
    exit 1
else
    echo "Installing mongodb-mongosh is SUCCESS"
fi