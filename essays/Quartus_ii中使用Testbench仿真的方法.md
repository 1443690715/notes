<!---title:Quartus_ii��ʹ��Testbench����ķ���-->
<!---keywords:FPGA-->
<!---date:old-->

## ����Modelsim·��

ִ��`Tools -> Options -> General -> EDA Tool Options`������Modelsim·�����£�

![ModelsimPath]

һ�����ú�һ���Ժ�Ͳ��������ˡ�

## ��дTestbench

1.	ʹ��ģ�壺

	ִ��`Processing -> Start -> Start Testbench Template Writer`����Testbenchģ���ļ���
	
	ʹ��`File->Open`���ڹ���simulationĿ¼�µ�Testbench�ļ����б༭

2.	�ֶ���д��

	`File -> New...`��ѡ��Verilg HDL File��Testbench�ļ�������׺���ʹ��*_tst.vt�����½����ļ��б�д�߼�����������ʾ��

	![TestbenchEx]



## ��������

ִ��`Assigments -> Settings -> EDA Tool Settings -> Simulation`���÷������

![ModelsimArgs]

![TestbenchSetting]

һ·OK��ִ��`Tools->Run Simulation Tools->RTL simulation`�򵯳�Modelsim�ķ�����棬�Ϳ��Խ��з�������ˡ�




[ModelsimPath]:../images/Quartus_ii��ʹ��Testbench����ķ���/ModelsimPath.jpg
[ModelsimArgs]:../images/Quartus_ii��ʹ��Testbench����ķ���/ModelsimArgs.png
[TestbenchSetting]:../images/Quartus_ii��ʹ��Testbench����ķ���/TestbenchSetting.png
[TestbenchEx]:../images/Quartus_ii��ʹ��Testbench����ķ���/TestbenchEx.png
