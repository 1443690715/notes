[<font size=4>��������Ŀ¼<font>](../README.md)
</br></br></br>

## ��Windows��������

Windows����Ŀ¼Ϊ`C:\Windows\Fonts\`������Ҫ�������ļ�������Linux�У����������/homeĿ¼�¡�

## �������������ļ���

CentOS��������Ŀ¼Ϊ/usr/share/fonts���ڸ�Ŀ¼���½��ļ���chinese��

```
su root
mkdir /usr/share/fonts/chinese
cd /usr/share/fonts/chinese
```

## ��װ����

```
yum install mkfontscale
yum install fontconfig

mkfontscale
mkfontdir
fc-cache -fv
```

����ϵͳ����`source /etc/profile`��

��ʱ��ʹ��`fc-list :lang=zh`���ɿ�����װ���������塣

Ϊʹϵͳ�����û�����ʹ�ø����壬��Ҫ���������Ȩ�ޣ�

```
chmod -R 755 *.tff
chmod -R 755 *.TFF
```





