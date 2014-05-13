[<font size=4>��������Ŀ¼<font>](./README.md)
</br></br></br>

����������CentOS 6.5 64bit

Linux��Linux��ͨ��ʲô�����ļ��ء���NFS��Windows��Windows֮���ء��������ļ����ܾ�OK�ˣ���Windows��Linux֮���أ�

����Ǳ���Ҫ���Ķ�������samba��

## ����Ƿ�װsamba

```
# rmp -qa|grep samba
```

����װ�ˣ������ʾ���£�

```
samba4-libs-4.0.0-58.el6.rc4.x86_64
samba-common-3.6.9-168.el6_5.x86_64
samba-winbind-3.6.9-168.el6_5.x86_64
samba-client-3.6.9-168.el6_5.x86_64
samba-3.6.9-168.el6_5.x86_64
samba-winbind-clients-3.6.9-168.el6_5.x86_64
```

����ʹ��

```
# yum install smaba
```

��װsamba.

## ����samba 

1.	���ÿ�������

	```
	# chkconfig smb on
	# chkconfig nmb on
	```

	Ҳ����ʹ��setup�����ͨ���������ÿ�����������,

	```
	# setup
	```

	![setup][]

2.	�½�smb�û����ڷ���Linux�����ļ�

	```
	# useradd smb       # �½��û�
	# smbpasswd -a smb  # �޸�����
	```

	��ʱ/homeĿ¼������һ��smb���û�����Linux�û�Ŀ¼����ֱ�ӹ���Windows�¡���Ҫ���������ļ���������3�����ļ�����������ˣ�ɾ��smb�û�Ҳ�ǿ��Եģ�

	```
	# smbpasswd -x smb  # ɾ��smb�û�
	```

3.	samba�����ļ���

	```
	[tmp]
	comment = Tmp Directories
	path = /tmp                         # �����LinuxĿ¼
	public = no                         # Ŀ¼������
	writeable = yes                     # ��д
	browseable = yes                    # �ɶ�
	valid users = smb                   # �����û��������½��ģ�Ҳ����ʹ��ԭ�����е�
	```

## ��smabaͨ������ǽ

ʹ��samba��Ҫ��������ǽ����˸��ݲ�ͬ����������ṩ3�ַ�����
	
- ����1

	```
	# system-config-firewall
	```

	![smb-firewall][]

- ����2

	����/etc/sysconfig/iptables�ļ������

	```
	-A INPUT -m state --state NEW -m tcp -p tcp --dport 139 -j ACCEPT
	-A INPUT -m state --state NEW -m tcp -p tcp --dport 445 -j ACCEPT
	-A INPUT -m state --state NEW -m udp -p udp --dport 137 -j ACCEPT
	-A INPUT -m state --state NEW -m udp -p udp --dport 138 -j ACCEPT
	```

	����139 445 137 138�����˿�ͨ�������������������ǽ��

	```
	# /etc/rc.d/init.d/iptables restart
	```

- ����3

	���ԣ��ѷ���ǽ���ˣ�

	```
	# service iptables stop    # ��ʱ�ر�
	# chkconfig iptables off  # ���ùر�
	```

## �ر�SELINUX

```
# vim /etc/selinux/config
SELINUX=permissive
```

��ʱ��Ҫ������ϵͳ��

```
# reboot
```

## ����samba 

```
# service samba start   # ����
# service samba restart # ����
```

����ͨ��

```
# service samba status
```

�鿴samba����״̬��

## Windows����

�Ȳ鿴Linux���������ip��ַ��

```
# ifconifg
eth0      Link encap:Ethernet  HWaddr 00:0C:29:FD:DC:43  
          inet addr:192.168.56.58  Bcast:192.168.56.255  Mask:255.255.255.0
          inet6 addr: fe80::20c:29ff:fefd:dc43/64 Scope:Link
```

��Windows��ʹ��Win+R�������д��ڣ�����

```
\\192.168.56.58
```

���ɷ���Linux�����Ŀ¼��

![smb][]

��ʱʹ��

```
# smbstatus
```
�鿴����״̬��

![smbstatus][]

> �ļ�����Ȩ�ޣ�

> ���޷���Windows��������Ŀ¼�п����ļ����������ڹ���Ŀ¼��smb�û���дȨ�޲��㣬Linux��ʹ��chmod 777 -R dir�ɸı�dirĿ¼Ȩ�ޡ�����Ȩ��ԭ�򣬱�����ʹ��/tmpĿ¼������Ϊ/tmpĿ¼�������û���Ȩ�ޱȽϿ��š�


## �ο�

1. http://www.livingelsewhere.net/tag/unix-linux-samba-ftp-smb-cifs/
2. http://www.tangrucheng.com/centos6-5-setup-configure-samba.html

[smbstatus]:../images/CentOS����smaba��Windows�����ļ�/smbstatus.png
[smb]:../images/CentOS����smaba��Windows�����ļ�/smb.png
[smb-firewall]:../images/CentOS����smaba��Windows�����ļ�/smb-firewall.png
[setup]:../images/CentOS����smaba��Windows�����ļ�/setup.png
