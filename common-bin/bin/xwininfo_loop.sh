#!  /bin/sh
XWINFO=`xwininfo | perl -ne '/Window id: (0x[\da-z]+)/ and print $1'`
echo "#################################"
echo $XWINFO
while [ 1 ]
do
    clear
    date
    xwininfo -id $XWINFO | grep 'Width\|Height'
    cols=$(tput cols)
    lines=$(tput lines)
    echo "Terminal Size:"
    echo "    ${cols}x${lines}"
    sleep 1
done

