#!/bin/bash

if [ -f /.root_pw_set ]; then
	echo "Root password already set!"
	exit 0
fi

PASS=${ROOT_PASS:-$(pwgen -s 12 1)}
_word=$( [ ${ROOT_PASS} ] && echo "preset" || echo "random" )
echo "=> Setting a ${_word} password to the root user"
echo "root:$PASS" | chpasswd

adduser --disabled-password --gecos "" -s /bin/bash --quiet $USER
adduser $USER sudo
DPASS=${USER_PASS:-$(pwgen -s 12 1)}

_word=$( [ ${USER_PASS} ] && echo "preset" || echo "random" )
echo "=> Setting a ${_word} password to the $USER user"
echo "$USER:$DPASS" | chpasswd


echo "=> Done!"
touch /.root_pw_set

echo "========================================================================"
echo "You can now connect to this Ubuntu container via SSH using:"
echo ""
echo "    ssh -p <port> root@<host>"
echo ""
echo " root password : $PASS "
echo ""
echo " $USER password : $DPASS "
echo ""
echo "use this to connect to the x2go server from your x2go client!"
echo "Please remember to change the above password as soon as possible!"
echo "========================================================================"
