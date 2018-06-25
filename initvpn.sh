#ver initvpn20180418
#增加了openvpn的初始化,
#v1.3 增加了启动www文件
netcard_name=`ifconfig | head -1 | awk -F ":" '{print$1}'`
currPubIP=`grep '$pubIP' /var/www/html/user_reg_new/class.user.php | awk -F "'" '{print $2}'`
echo "设备当前的公网地址为：$currPubIP"
#调整公网IP地址
newPubIP=`lynx --source www.monip.org | sed -nre 's/^.* (([0-9]{1,3}\.){3}[0-9]{1,3}).*$/\1/p'`
    sed -r 's/(\b[0-9]{1,3}\.){3}[0-9]{1,3}\b'/$newPubIP/g -i /var/www/html/user_reg_new/class.user.php
    sed -r 's/(\b[0-9]{1,3}\.){3}[0-9]{1,3}\b'/$newPubIP/g -i  /var/www/html/daloradius/library/exten-welcome_page.php
    sed -r 's/leftid=\"(\b[0-9]{1,3}\.){3}[0-9]{1,3}\b'/leftid=\"$newPubIP/g -i /etc/strongswan/ipsec.conf
    sed -r 's/(\b[0-9]{1,3}\.){3}[0-9]{1,3}\b'/$newPubIP/g -i  /etc/openvpn/easy-rsa/3.0/client.ovpn
    sed -r 's/(\b[0-9]{1,3}\.){3}[0-9]{1,3}\b'/$newPubIP/g -i /root/zhengshu.sh
cd /root/
./zhengshu.sh
zip -p -r client.zip client.cert.p12
zip -p -r ca.zip ca.cert.pem
alias cp='cp'
cp -rf client.zip /var/www/html/user_reg_new/
cp -rf ca.zip /var/www/html/user_reg_new/
mkdir openvpnclient
cp -rf /etc/openvpn/easy-rsa/3.0/client.ovpn ./openvpnclient/
cp -rf /etc/openvpn/easy-rsa/3.0/pki/ca.crt ./openvpnclient/
zip -p -r openvpnclient.zip ./openvpnclient/
cp -rf openvpnclient.zip /var/www/html/user_reg_new/
service strongswan restart
