#!bin/bash
echo ""
echo "======= Hostname ======="
echo $HOSTNAME
echo "========================"
echo ""
echo ""
echo "======================= Last Login by Username ======================="

for username in $(getent passwd | cut -d ":"  -f1) ; do
    last_login=$(last $username| head -1 | awk '{ print $4, $5, $6 }')
    if [ ${#last_login} -le 5 ]; then
        last_login="No info"
    fi
    hostname=$(hostname -s)
    ugecos=$(getent passwd $username | cut -d ":"  -f5)
    ushell=$(getent passwd $username | cut -d ":"  -f6)
    echo $username","$last_login","$ugecos","$ushell","$hostname
done

echo ""
