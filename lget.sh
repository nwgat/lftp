#read down
lftp -e 'pget -n 5 '$1' && exit'
echo "done."
