#!/bin/bash

# Colors
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_BLUE=$ESC_SEQ"34;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_CYAN=$ESC_SEQ"36;01m"
echo ""
echo "####> Nwgat LFTP Mirror Script <####"
echo "http://nwgat.net / contact@nwgat.net"
echo ""
PS3='Please enter your choice: '
options=("mirrorfrom" "mirrorto" "lftp" "lget" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "mirrorfrom")
            clear
echo ""
echo "####> Nwgat LFTP Mirror Script <####"
echo "http://nwgat.net / contact@nwgat.net"
echo ""

            echo -e "$COL_RED # Mirroring from Server < # $COL_RESET"
	    echo ""
	    echo "site:port"
	    read site
	    echo "username and password (user:password)"
	    read usrpw
	    echo "remote path"
	    read remotepath
	    echo "local path"
	    read localpath
	    echo "running lftp"
            lftp sftp://$usrpw@$site -e 'mirror --verbose --use-pget-n=8 -c '$remotepath' '$localpath''
            ;;
        "mirrorto")
            clear
echo ""
echo "####> Nwgat LFTP Mirror Script <####"
echo "http://nwgat.net / contact@nwgat.net"
echo ""

            echo -e "$COL_RED # Mirroring to server > # $COL_RESET"
            echo "site:port"
            read site
            echo "username and password (user:password)"
            read usrpw
            echo "remote path"
            read remotepath
            echo "local path"
            read localpath
            echo "running lftp"
            lftp sftp://$usrpw@$site -e 'mirror -R --verbose --use-pget-n=8 -c '$localpath' '$remotepath''
            ;;
        "lftp")
            lftp
            ;;
        "lget")
	    echo "url to download"
	    read down
	    lftp -e 'pget -n 5 '$down' && exit'
            echo "done. check your script directory"
            ;;
        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done

