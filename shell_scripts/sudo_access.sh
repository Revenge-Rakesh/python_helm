#***** Providing sudo access to the users ******

#!/bin/sh

while [ -n "$1" ]; do
    echo "$1    ALL=(ALL:ALL) ALL" >> /etc/sudoers;
    shift 
done
