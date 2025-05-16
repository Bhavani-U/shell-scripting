
#!/bin/bash

NUMBER=$1

if [ $NUMBER -gt 10 ]
then
    echo "Given number $Number id grater than 10"
else
    echo "Given number $Number id less than 10"
fi

# -gt, -lt, -eq, -ge, -le, -ne