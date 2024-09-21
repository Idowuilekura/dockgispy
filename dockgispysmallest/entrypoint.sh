#!/bin/sh
rm  -f /opt/neccessary/requirements.txt

error_code_fun () {
    echo "\033[1;31m $1\033[m"
}
warning_code_fun () {
    echo "\033[1;33m $1\033[m"
}
if [ -z $IDE_SET ]
    then echo "IDE not set"
elif ! [ -z $IDE_SET  ]; then
    echo "IDE set was  to $IDE_SET"
    check_number=$(echo "$IDE_SET" | grep "^[0-9]*$")
    if [ "$check_number" != '' ]; then
        # "Error Code: ${RED}1234${NORMAL}"
        # echo "\033[2;31m Error: You set the IDE to a number which is invalid or not supported. Kindly, use characters enclosed in a single quotes\033[m"
        error_code_fun "Error: You set the IDE to a number which is invalid or not supported. Kindly, use characters only"
        error_code_fun "The container will exit and shutdown now"
    exit 
    else 
        echo "IDE set to string"
    fi 
fi


if [ -z $IDE_SET ]; then
    warning_code_fun "No IDE set defaulting to jupyter lab"
    jupyter lab --ip 0.0.0.0 --port 8888 --allow-root
else
    # IDE_SET=$(echo ${IDE_SET,,})
    # convert upper case to lowercase
    IDE_SET=$(echo "$IDE_SET" | tr '[:upper:]' '[:lower:]')
    echo "IDE set to $IDE_SET"
    if [ $IDE_SET = "notebook" ]
     then
        echo "IDE set to $IDE_SET" 
        echo "About to start Jupyter notebook....."
        jupyter notebook --ip 0.0.0.0 --port 8888 --allow-root
    elif [ $IDE_SET = "lab" ]
        then
        echo "IDE set to $IDE_SET"
        echo "About to start Jupyter Lab....."
        jupyter lab --ip 0.0.0.0 --port 8888 --allow-root
    else 
        error_code_fun "You specified an invalid IDE, use notebook or lab to set the IDE" 
        warning_code_fun "Defaulting to jupyter lab"
         echo "About to start Jupyter Lab....."
        jupyter lab --ip 0.0.0.0 --port 8888 --allow-root
    fi
fi

