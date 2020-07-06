if [ $# -ne 2 ]; then
    echo "Invalid arguments"
    exit 1
else
	sudo useradd -m "$1"
	printf "$2\n$2" | sudo passwd $1
	sudo passwd --expire $1
	sudo chsh -s /bin/bash $1

	echo "Username: $1"
	echo "Password: $2"
	echo "User will be required to change password on first logon"
fi 
