[<font size=4>��������Ŀ¼<font>](../README.md)
</br></br></br>

����������CentOS 6.5 64bit �������

## ���ڵ�yumԴ��������

1.	�Ϻ�����<http://ftp.sjtu.edu.cn/centos/>������λ���ڱ������������нϿ�
2.	�й��ƴ�<http://centos.ustc.edu.cn/>������λ���ںϷʣ��Ϸ�
3.	����163��<http://mirrors.163.com/centos>�������Ƽ�
4.	�Ѻ�����<http://mirrors.sohu.com/>��ɽ����ͨ����


## ����滻ԭ�е�yumԴ

���Ľ��滻ԭ��CentOS�ٷ���yumΪ163��yumԴ��

```shell
su root
cd /etc/yum.repos.d
mv CentOS-Base.repo CentOS-Base.repo.bak                 # ����ԭ�е�yumԴ
wget http://mirrors.163.com/.help/CentOS6-Base-163.repo  # ��ȡ163��yumԴ�ļ�
mv CentOS6-Base-163.repo CentOS-Base.repo                # ʹ��163��yumԴ��ΪĬ�ϵ�yumԴ
yum clean all && yum makecache && yum update -y          # yum����
```

����613�ṩ��yumԴ��CentOS-Base.repo�ļ������Ϻ�������пƴ��yumԴ������Ҫ�Լ�д�������˵��ʹ��163��yum���¸�����Щ��
