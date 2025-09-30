#!/bin/bash

# Automation goal is to KEEP LESS LINEs with DO NOT REPEAT yourself (DRY) and reuse the code.

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR: Please run this script with root privelege"
    exit 1 # failure is other than 0
fi
validate() {
    if [ $1 -ne 0 ]; then
    echo "ERROR: Installing $2 is FAILURE"
    exit 1
else
    echo "Installing $2 is SUCCESS"
fi
}

dnf install mysql -y
validate $? "MySQL"

dnf install nginx -y
validate $? "Nginx"

dnf install python3 -y
validate $? "python3"