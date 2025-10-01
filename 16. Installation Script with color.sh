#!/bin/bash

# Automation goal is to KEEP LESS LINEs with DO NOT REPEAT yourself (DRY) and reuse the code.

R="\e[31m" #Red
G="\e[32m" #Green
Y="\e[33m" #Yellow
N="\e[0m" #white/Normal color we can use 37 as well in place of 0

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR: Please run this script with root privelege"
    exit 1 # failure is other than 0
fi
validate() {
    if [ $1 -ne 0 ]; then
    echo -e "$R ERROR: Installing $2 is FAILURE $N"
    exit 1
else
    echo -e "Installing $2 is $G SUCCESS $N"
fi
}

dnf list installed mysql
# install if it is not found
if [ $? -ne 0 ]; then
dnf install mysql -y
validate $? "MySQL"
else
    echo -e "MySQL already exist...$Y SKIPPING $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]; then
    dnf install nginx -y
    validate $? "Nginx"
else
    echo -e "nginx already exist...$Y SKIPPING $N"
fi

dnf list installed python3
if [ $? -ne 0 ]; then
    dnf install python3 -y
    validate $? "python3"
else
    echo -e "python3 already exist...$Y SKIPPING $N"
fi