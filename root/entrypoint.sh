#!/bin/bash

useradd $USERNAME -m
echo -e "$PASSWORD\n$PASSWORD" | passwd $USERNAME
passwd --expire $USERNAME
chsh -s /bin/bash $USERNAME
usermod -aG sudo $USERNAME

chown $USERNAME:$USERNAME /add.sh
chown $USERNAME:$USERNAME /del.sh

chmod 500 /add.sh
chmod 500 /del.sh

start-stop-daemon -S -n inspircd -x /usr/sbin/inspircd -c irc

/usr/sbin/sshd -D