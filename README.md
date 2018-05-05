# vpnServer

This script is for Centos7<br>

This is a script to quick install vpn server<br>

I make a video Tutorial on youtube https://youtu.be/Ic8VGP3pdCk

I use openvpn and strongswanvpn as VPN server<br>

Use daloradius to manage VPN client<br>

<img src="http://www.beijinghuayu.com.cn/wp-content/uploads/2018/03/daloradius%E8%B4%A6%E6%88%B7%E9%85%8D%E7%BD%AE.png">

# Begin to install on Centos7,use below commonds

```bash
sudo -i
yum install wget -y
wget https://raw.githubusercontent.com/zhuchunmao/vpnServer/master/vpnServer-install-script.sh
chmod +x installvpn.sh
./installvpn.sh
```

# Feature

1、It's has two VPN servers (oepnvpn and strongswan)

2、Use daloradius to manage VPN client users
<img src="http://www.beijinghuayu.com.cn/wp-content/uploads/2018/03/daloradius%E8%B4%A6%E6%88%B7%E9%85%8D%E7%BD%AE.png">

3、It's has Client connection VPN tutorial page

The tutorial page is introduce windows,OSX,iphone system how to connect to VPN server

<img src="http://www.beijinghuayu.com.cn/images/vpn-connect-help.png">

