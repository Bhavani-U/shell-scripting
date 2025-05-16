#!/bin/bash


USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOFFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
y="\e[32m"
N="\e[0m"

VALIDATE(){
   if [ $1 -ne 0 ]
   then
        echo "$2...FAILURE"
        exit 1
    else
        echo "$2...SUCCESS"
    fi

}

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root access."
    exit 1 # manually exit if error comes.
else
    echo "You are super user."
fi


for i in $@
do
    echo "pakage to install : $i"
    dnf list installed $i &>>$LOFFILE
    if [ $? -eq 0 ]
    then    
        echo  -e "$i already installd...$Y SKIPPING $N"
    else
        echo "$i not installed...Need to install"
    fi
done
#sudo sh filename pakagename1 packagename2

