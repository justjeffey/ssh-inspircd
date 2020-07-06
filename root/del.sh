if [ $# -ne 1 ]; then
    echo "Invalid arguments"
    exit 1
else
	echo "Deleting $1"
	sudo userdel -rf "$1"
fi 
