[<font size=4>��������Ŀ¼<font>](../README.md)
</br></br></br>

��ʵ��ע��ĵط��������������ˣ�һֱ����Ӳ������������з���������������Ա��´ΰ�װ�Ĳ�ʱ֮�衣

## ׼��

1. ׼��Win7ϵͳ
2. ����CentOS6.3
3. ����EasyBCD����װ

## Ӳ�̰�װ����

1\. �ڳ�һ���������»���һ��E�̣���С����Ϊ10G�Ϳ����ˣ�ע��һ��ҪС��32G����FAT32��ʽ������̡�

2\. ����DVD�����ļ�centos6.3***-dvd.iso������E�̣��������ioslinux�ļ����е�vmlinuz��initrd.img�ļ����Լ�images�ļ�����ȡ��������ѹ����CentOS�����ļ���ͬ��Ŀ¼����ѹ���E��Ӧ����4���ļ���

	- iso
	- vmlinz
	- initrd.img
	- images


3\. ��EasyBCD��Add New Entry �C> NeoGrub �� > Install �C> Configure�� ��ʱ�ᵯ��һ��txt�ļ�������������

```
title install centos6.3

kernel (hd0,4)/vmlinuz

initrd (hd0,4)/initrd.img

```

>> ��Ϊ��װwindows7��ʱ��ϵͳ�Դ�����һ��100M����������������Ϊhd0����ôC�̴��ž�Ϊhd0,1�ˡ��Դ����ƣ��ҵ�Win 7�ֳ���C��ϵͳ�̺�D�̣���ôE��Ϊ�߼�������һ����������ô����hd0,4�ˡ�


4\. �رգ�������ѡ��centos������

ѡ��centos6.3***-dvd.iso�ļ����ڵ�Ŀ¼��Ȼ����ְ�װ�˵���ʱ��һ��Ҫѡ��Install or upgrade an existing system����windows7�Կ��������ܶ԰�װ������Ӱ�졣ʣ�µľͲο����̰�װ���衣

5\. ��������

ѡ��Create Custom Layout

	/boot ext4 100MB
	/swap swap 2~4GB(3GB)
	/     ext4 ʣ��ռ�

/boot��/swapһ���Ǳ���ģ�һ���û���������Ҫ�����ܻ��Ữ��/home�������Ѵ󲿷����Ϸ���home�еĻ���/home��ô�һЩ��

6\. ѡ��������

�����̺�ᵯ����װ��������򣬼�ס������������ð�װ��ϵͳӲ���ϣ���ϰ��ֱ�Ӱ�װ����Linuxϵͳ��ͬ�����£�
