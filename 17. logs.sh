#!/bin/bash
USERID=$(id -u)
R="\e[31m" #Red
G="\e[32m" #Green
Y="\e[33m" #Yellow
N="\e[0m" #white/Normal color we can use 37 as well in place of 0

LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "script exeuctued at: $(date)"


if [ $USERID -ne 0 ]; then
    echo "ERROR: Please run this script with root privelege"
    exit 1 # failure is other than 0
fi

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

dnf list installed mysql &>>$LOG_FILE
# install if it is not found
if [ $? -ne 0 ]; then
dnf install mysql -y &>>$LOG_FILE
validate $? "MySQL"
else
    echo -e "MySQL already exist...$Y SKIPPING $N"
fi

dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install nginx -y &>>$LOG_FILE
    validate $? "Nginx"
else
    echo -e "nginx already exist...$Y SKIPPING $N"
fi

dnf list installed python3 &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install python3 -y &>>$LOG_FILE
    validate $? "python3"
else
    echo -e "python3 already exist...$Y SKIPPING $N"
fi
