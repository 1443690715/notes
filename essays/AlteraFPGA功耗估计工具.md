[<font size=4>��������Ŀ¼<font>](../README.md)
</br></br></br>

ע������������������ժ¼������ˮƽ���ޣ��Լ���δ���Թ�����ȥ��ȡ����

## ���ڹ��Ĺ���

��Altera�Ĺٷ���վ<http://www.altera.com.cn/support/devices/estimator/pow-powerplay.jsp>�������ص�Altera�����ڹ��Ĺ��㹤�ߣ��ù�����ʹ��Excel�����������ڡ�ָ��������Ƶ�·֮ǰ��ͨ��ϵͳ��Ҫ��ɵĹ��ܡ���Ҫʹ�õ�FPGA��Դ����FPGA�Ĺ��ģ��Ӷ�ȷ����Դ����Χģ�����ơ�

![PowerPlay]

��Input Parameter������FPGA�ͺš���װ���¶ȵ���Ϣ��

�ص���Thermal Power�еĲ���������Ҫ��������ǰ��ϵͳ��Ҫ�õ���FPGA���ܽ��л��֡�����Դ����Ԥ����

1.	�����ܽ���ϵͳģ�黮�֣����ι���ÿ��ģ�������Logic��RAM��Multiplier��I/O��PLL�ȣ��磺

	```
	            Usart   SPI     ADC      Flash
	
	LUT         xx      xx
	
	FF          xx
	
	RAM         xx
	
	Multiplier  xx
	
	I/O
	
	PLL
	```

	��Ȼ��Ԥ�����Ͳ�Ҫ����ô��ȷ������ÿ��ģ�����Դʹ����Ҫ��һ����FPGA�������飬Quartus ii����󶼻���һ����Դʹ�ñ����ö��ˣ�Ҳ����д�������ˡ�

2.	Logic�ӽ��棬Logic�����LUT��FF�������ο�Datasheet�е����ֵ����ģ���ʹ��֮��ΪFPGA�����ֵ�������ɸ߹����ɵ͹�����


## ���ڹ��Ĺ���

����ɴ󲿷�����ȫ����Verilog������ƺ󣬴�ʱ���������ŵ�·�߼����Ѿ�����������˿϶�����һ�����Ӿ�ȷ�Ĺ��Ĺ��㹤�ߡ�

Quartus ii��ִ�в˵�`Processing->PowerPlay Power Analyzer`�Ϳ������������ŵ�·����Ĺ��Ĺ��㣬����Ҳ���Դ�Quartus ii��������Task�����в�����

![PowerPlayAnalyzer]

PowerPlayAnalyzer��Ҫ�ṩһ������Input������ͼ���������������Modelsim���ż���������ģ�

1.	ִ��Quartus ii���Task����`EDA Netlist Writer`
2.	ִ���ż����棬`Tools->Run EDA Simulation Tool->EDA Gate Level Simulation`.



[PowerPlay]:../images/AlteraFPGA���Ĺ��ƹ���/PowerPlay.png
[PowerPlayAnalyzer]:../images/AlteraFPGA���Ĺ��ƹ���/PowerPlayAnalyzer.png

