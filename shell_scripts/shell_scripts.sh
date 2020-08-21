# **********1. Adding Required User ********** #
# **********2. Providing the sudo access ********** #

#!/bin/bash

if [ $(id -u) -eq 0 ]
then
    echo "Enter the User name You want to add"
    read  username
    echo "Enter the Password for the user"
    read password
    if [ $? -ne 0 ]
    then 
        echo "User with $username exists. :("
        exit 1
    else 
      useradd -m -p "$password" "$username"
      if [ $? -eq 0 ]
        then echo "User has been added to the System!. (:"
      else   echo "Failed to add user. ):"   
      fi
    fi         

else
  echo "Only root user can add the user"
  exit 2
fi

#**********2. Providing the sudo access ********** 

sudo_acess_function() {
     while [ -n "$1" ]; do
        echo "$1    ALL=(ALL:ALL) ALL" >> /etc/sudoers;
        shift
     done
}


#invoking the function 
sudo_acess_function $username
    
