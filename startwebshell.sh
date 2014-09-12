#!/bin/bash
# add user to docker group (if GID was informed)
if [ -z $GID ]
then
 echo "No GID for docker. Ignoring."
else
 echo "Creating group docker with gid=$GID"
 groupadd -g $GID docker
 usermod -a -G docker user
fi
# changes user password if asked
if [ -z $USERPWD ]
then
  echo "User default password in use"
else
  echo "Changing user password"
  echo $USERPWD | passwd user --stdin
fi
# start sshd on background
/usr/sbin/sshd
cd /opt/WebShell-0.9.6
exec ./webshell.py --ssl-disable -i 0.0.0.0

