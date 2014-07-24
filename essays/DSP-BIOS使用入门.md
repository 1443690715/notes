[<font size=4>��������Ŀ¼<font>](../README.md)
</br></br></br>


## �ӻ���˵�����һ������

��ע�⣬����Ĭ�϶����Ѿ���DSP��CCS V3.3������һ�����˽��ˣ�֪��cmd�ļ������ã�֪���½����̣����벢���ӷ��������أ���������Щ��������Ϥ��������Ϥ��Щ����Ȼ�����Ҫ�в���ϵͳ�Ļ�����������񡢵��ȡ��жϣ�

1.	��һ�����⣺DSP/BIOS���ðɣ�����һ������д����ʲô��

	��TI��˾ר��ΪDSP������Ƕ��ʽʵʱ����ϵͳ����Ȼ��TI��˾Ϊ�Լ���DSP�����ġ����ٷ��ģ���Ȼ�����Ǹܸܵ��ˣ���Ȼ���һ������ţ����Ҳ�ǵ���;˵��û��ʵ����ᣩ����Ȼ˵��ʵʱ����ϵͳ���ǻ�����ЩǶ��ʽʵʱ����ϵͳ�أ�Linux���𡪡����ǣ�VxWorks�����ǣ�Ŷ������һ��С�Ŀ�Դϵͳ����uCOS IIҲ�ǡ�

2.	�������Ҫʹ��DSP/BIOS����Ҫ��װʲô�����أ�

	����ΪCCS v3.3��Ĭ�ϾͰ�װ��DSP/BIOS���汾ΪV5.31.2������ͨ��`Help->About...`�˵��鿴�汾������Ȼ�������Ҫ�����汾������ͬʱ��װ����汾�������Ե�TI�������أ����ӣ�
	
	<http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/bios/dspbios/index.html>

	��ע�⣺DSP�������ͺš�CCS�汾��DSP/BIOS�汾֮����ڼ����ԣ���ע��ѡ��

	���غ�װ��CCS����Ŀ¼��ͨ��`Help->About...`�е�Managerѡ��ʹ�õ�BIOS�汾��

	![1]

	����ʹ�õ���CCS V3.3Ĭ�ϵ�DSP/BIOS�汾����V5.31.2��������˵�������ĵ�����������TI��CCS 3.3�������ģʽ�£����滷���������£�ʹ��C6713���������棩��
	
	![2]

3.	����������ν�����һ��BIOS���̣�

	�Ƚ���һ����ͨ���̣�`Project->New...`�����£�

	![3]

	`File->New->DSP/BIOS Configuration...`�½�DSP/BIOS�����ļ���

	![4]
	![5]

	����һ�£������ļ��ĺ�׺Ϊ*.tcf.

	��__�����ļ����������ļ��Զ����ɵ�cmd�ļ�__��ӵ����̣�

	![6]

	�½�һ��main.c�ļ���__��main.c��ӵ�����__�������������Ȼ�󻹵��������⣩��д����򵥵Ĵ���ɣ�

	```
	int main(void)
	{
		return 0;
	}

	```

	����һ�¹��̣���ʱ���ִ�����ʾ��

	```
	js: "./bios_first.tcf", line 11: Heaps are enabled, but the segment for DSP/BIOS Objects (MEM.BIOSOBJSEG) is not set correctly. Please create a heap in one of your data segments and set MEM.BIOSOBJSEG to it.
	```

	û��ϵ������һС�ڽ�������ôȥ���ô���

## DSP/BIOS�����÷���

1.	ϵͳ����
	
	![7]

	��Global Setting���Ҽ����ԣ�����DSPĿ���ʱ�ӣ�CLKOUTʱ���Լ���С��ģʽ��
	
	����Call User Init Functionѡ�Ĭ���Ǵ򿪵ģ����������ʵ��Ŀ��壬������ڴ˴������û���ʼ��PLL��EMIF�ȵĴ���ĺ������й�PLL��ʼ�����Ĵ���ο�����C6713�Ĺ��̣��������������ģʽ�£���ȥ����ѡ����������ʱ���ⲻ�ٴ���

	����������SDRAM���Ѵ�С��

	![8]
	![9]

	���ڿ������±���һ�¹����ˣ���ϲ��ϲ������ɹ���֮ǰ��ʾ�ĶѴ�������������ģ�

	���ڣ�����Ҫ���������SDRAM�Ĵ洢�ռ���л��֣�������ǰûʹ�ò���ϵͳʱҪдcmd�ļ�һ��������Ļ��ֽ��Զ����ɻ��޸�cmd�ļ�����ʹ��DSP/BIOS�ܷ��㣬��MEM���Ҽ�`Insert MEM`�Ϳɲ�������ˣ��ⲿ�ֹ��ܶ�Ӧ��cmd�Ͼ���������cmd��MEMORY�Ĺ��ܣ�

	```
	MEMORY
	{
	    BOOT_RAM: o=00000000h,l=00000400h   
		IRAM    : o=00000400h,l=0003FC00h

	    /* CE2: SDRM 256Mbit */
		SDRAM:	o = 80000000h,l=01000000h  /* 128Mbit */
	    GB_MEM: o = 81000000h,l=01000000h  /* 128Mbit */ 
	    
	    /* Flash */
		FLASH_BOOT : o=90000000h,l=00000400h
	    FLASH_REST : o=90000400h,l=000FFB00h 
	}
	```

2.	LOG������

	LOG����˵���˾�������ʵ��printf�ģ�STS���������������ļ���ֵ��

	��LOG���Ҽ�`Insert LOG`������һ��trace�Ĵ�ӡ����

	![10]

	��main.c�б�д���´��룬

	```
	#include "bios_firstcfg.h" // DSP/BIOS�Զ����ɣ������ڹ������ҵ��������˶�trace�������Լ����ͷ�ļ��İ���

	int main(void)
	{
	    LOG_enable(&trace);
	    LOG_printf(&trace, "Hello DSP/BIOS %d.", 0); 

		return 0;
	} 
	```

	����ͨ����װ�س��򣬴򿪲˵�`DSP/BIOS->Message Log`�����г���Ч����ͼ��

	![11]

	ע�⣬����ĳ�������ͨ��LOG_printf��������printf��ӡ��Ϣ�ģ��������й�LOG�ĺ������У�

	```
	LOG_disable. Disable the system log.
	LOG_enable. Enable the system log.
	LOG_error. Write a user error event to the system log.
	LOG_event. Append unformatted message to message log.
	LOG_event5. Append 5-argument unformatted message to log.
	LOG_message. Write a user message event to the system log.
	LOG_printf. Append formatted message to message log.
	LOG_printf4. Append 4-argument formatted message to log.
	LOG_reset. Reset the system log.
	```

	���ˣ���������ѧϰDSP/BIOS�����ĵ�1��ģ�飨Module������LOGģ�顣

	��ʵDSP/BIOS�л��кܶ�ģ�飬�ο�TI�ĵ���SPRU430S��TMS320C6000 DSP/BIOS 5.x Application Programming Interface (API) Reference Guide��

	![12]

3.	����ģ�������

	����ϵͳ������ľ������������������������½����������Ҽ���������������������ͼ��

	![13]

	��TSK_task1����ͬ�����ã���ע�⣬���е�Task functionҪ��C����ǰ���»��ߣ�

	��main�����������������Ĵ��룬

	```
	void func_task0(void)  // ��Ӧ�ղŵ�_func_task0
	{
		static Uint16 TSK0 = 0;

		while (1) {   // ����һ�㶼����ѭ����ִֻ��һ�ε��������岻��
	        LOG_printf(&trace, "TSK0=%u", TSK0++);
			TSK_yield();
		}		
	}

	void func_task1(void)  // ��Ӧ�ղŵ�_func_task1
	{
		static Uint16 TSK1 = 0;

		while (1) {
	        LOG_printf(&trace, "TSK1=%u", TSK1++);
			TSK_yield();
		}		
	}
	```

	���±���װ�أ����к���Message Log�����¿�����Ч�����£�

	![14]

	����ϵͳ����������ѭ���Ľṹ��Ҫʵ��������ȱ���Ҫ��ÿ�������п��е�ʱ�䣬��������������е�TSK_yield()ע�͵������±���װ�����У���ʱ�����һֱ��func_task0��ִ�С�

	TSK_yield����������þ����������ͬ���ȼ�����������ȵ�ͬ���ȼ�����������ִ�У�

	TSKģ��������кܶ࣬�������ú������⣬�������������ȼ�����������ȣ����Ⱥ���Ҳ�кܶ࣬��һ�����õ���ʹ��˯�ߵ��Ⱥ�������TSK_sleep����ʹ�����£�

	```
	void func_task(void)
	{
	    while(1) {
	    	// �������

	    	TSK_sleep(100);  // 100��ʾϵͳʱ�Ӽ���
	    }
	}
	```

4.	���ж�SWIģ�������

	�жϾ��б��κ����񶼸ߵ����ȼ���������Ӳ���жϣ�HWI���ֱ�����жϣ�SWI�����ȼ����ߡ�

	![15]

	���ж����䲻���ź��е���Ϣ���䣬���������ƣ������ֵΪ���ж�����ĸ�λֵ��

	һ�����ж������ֵ�ﵽ0ʱ����������жϣ�������һ��ִ����ɣ����Ǳ�Ӳ���жϴ�ϣ���ִ��������ж�����ָ�����λֵ��������һ��ִ����ɣ����������ͬ�����ж��о���������ѭ���������һֱִ�����жϣ�����ͱ�ִ���ˣ���

	������������жϺ����е����ݣ�task1ÿִ��2�Σ�����һ�����жϣ����жϼ���ֵ+1��

	```
	void func_task1(void)  // ��Ӧ�ղŵ�_func_task1
	{
		static Uint16 TSK1 = 0;

		while (1) {
	        LOG_printf(&trace, "TSK1=%u", TSK1++);
			SWI_dec(&ADC_swi);  // ���ж��������ֵ�ݼ�
			TSK_yield();
		}		
	}

	void swi_adc(void)
	{
	    static Uint16 adc_cnt = 0;

	    LOG_printf(&trace, "SWI_ADC=%u", adc_cnt++);

		// һ��ִ���������ֵ�ָ�Ϊ��ʼֵ2
	}
	```

	![16]

	SWI_dec()���������޸����ж�����ļ���ֵ�����������ж���������ĺ�����������

	```
	void SWI_or(swi, mask);  // ����ֵ��mask���л��������ֵΪ0ʱ�������ж�
	SWI_Handle swi; /* SWI object handle*/
	Uns mask; /* value to be ORed */

	void SWI_andn(swi, mask);  // ����ֵ��mask������ǲ�������ֵΪ0ʱ�������ж�
	SWI_Handle swi; /* SWI object handle*/
	Uns mask /* inverse value to be ANDed */

	void SWI_inc(swi);  // Increment SWI��s mailbox value and post the SWI
	SWI_Handle swi; /* SWI object handle*/

	void SWI_dec(swi);  // Decrement SWI��s mailbox value and post if mailbox becomes 0
	SWI_Handle swi; /* SWI object handle*/
	```

	6000ϵ�е�DSP���ж�����Ϊ32λ��2000ϵ��Ϊ16λ�������Ǵ�����ï��DSP/BIOS����PPT�н�ȡ�����ж����亯���ĶԱ�ͼ������ʱ����ֵ�ı仯����ͼ��

	![17]
	![18]

5.	�ź���SEMģ�������

	�ź����ֻ����ź����ͼ����ź����������ź���ֻ������״̬�������ڲ����ã������ź���ͨ������һ������ֵ���������ֵ����0��������������ź���ʱ����������

	![19]

	��д��������������ִ��2�ν�һ�����жϣ����ｫ�ź�����ʼֵ��Ϊ1��task0��ʹ��SEM_pend�ȴ��ź�����task0ִ��1�ξͽ���ȴ�״̬���ٹ�һ�Σ��������жϣ����ж���ʹ��SEM_post�����ź������ź���ֵ��1��task0�յ��ź�����ӵȴ�״̬���أ�����ִ�У�

	![20]

	```
	status = SEM_pend(sem, timeout);
	SEM_Handle sem; /* semaphore object handle */
	Uns timeout; /* return after this many system clock ticks */

	����ֵ��Bool status; /* TRUE if successful, FALSE if timeout */
	```

	���timeout=0��ʾ���ȴ�����ִ�У�SYS_FOREVER��ʾһֱ�ȴ�ֱ���ź�����ֵ����0��SEM_post()������Լ򵥣���׸����

6.	�����������ʵʱ���ݽ���ģ������

	��֪ע�⵽û�У��������ģʽ�£�ʹ��Loadװ�س���ʱ�ܻᵯ�����µľ����

	![22]

	�����RTDXģ��û�����õ����⣬�����������RTDXģ�����Ҽ����ԣ��������£�

	![23]

	���úú����±��룬Loadʱ�Ͳ����ٵ����Ǿ�����ˣ�


�ܽ�һ�£���ʵ���������Ŀ�����һ����DSP/BIOS��ģ�黹�кܶ࣬����ֻ�����˼����Ƚϳ��õ�˵��˵���͹��ź�ͬ����һ���ͻ�����Ϣ���䡢��Ϣ���еȣ���ν��һ��������Щģ��Ĺ��ܼ��������壬�������˽�������DSP/BIOS֪ʶ�������Դ�������ֲ����ҵ���

1. SPRU430S: TMS320C6000 DSP/BIOS 5.x Application Programming Interface (API) Reference Guide
2. SPRU423F: TMS320 DSP BIOS User Guide
3. SPRU616A: DSP-BIOS Driver Developer's Guide

����֮�⣬Ҫ������ʹ��DSP/BIOS���Ͼ�����һ������ϵͳ����Ϥ����ϵͳ�Ļ����������Ҫ�����ѧϰ��ʹ�ù�uCOS ii��Linux��ЩȥѧϰDSP/BIOS��С��һ���ˣ�

## DSP/BIOS���̵�����˳��

1. ��ʼ��DSP��DSP/BIOS�����C/C++�������c_int00��ʼ���С�����C6000ƽ̨����c_int00��ʼ����ϵͳջָ�루B15����ȫ��ҳָ�루B14�����ֱ������ڶ�ջ�ϵ�ĩβ��.bss�ϵĿ�ʼ�����ƼĴ���AMR��IER��CSR�ȱ���ʼ����

2. ��ʼ��.bss�Σ�����ջ��������ɺ󣬳�ʼ�����񱻵��ã�����.cinit�ļ�¼��.bss�ϵı������г�ʼ����

3. ����BIOS_init��ʼ���õ��ĸ���ģ�飺BIOS_init����MOD_init�������õ��ĸ���ģ����г�ʼ��������HWI_init��HST_init��IDL_init�ȣ�

4. ����.pinit��.pinit�����һЩָ���ʼ��������ָ�룬��C++����ȫ�ֶ�����Ĵ���Ҳ�ڴ�ʱ��ɣ�

5. �����û������main�������û�main����������C/C++�������߻�����Ժ��������ڻ�ຯ����ʹ��_main�ĺ����������ڴ�ʱ��Ӳ��������жϻ�û�б�ʹ�ܣ��������û��������ĳ�ʼ������Ҫע�⣬����ʹ�ܵ������ж�����λ�����ǲ��ܵ�������HWI_enable�Ľӿ���ʹ��ȫ���жϣ�

6. ����BIOS_start����DSP/BIOS��BIOS_start���û�main�����˳��󱻵��ã�������ʹ��ʹ�õĸ���ģ�鲢����MOD_startup����ÿ��ģ�顣����CLK_startup��PIP_startup��SWI_startup��HWI_startup�ȡ���TSK����ģ���������б�ʹ��ʱ��TSK_startup��ִ�У�����BIOS_start������������أ�

7. ִ��idleѭ���������ַ�ʽ����idleѭ������TSK����ģ��ʹ��ʱ��������������е�TSK_idle�������IDL_loop�������������ʱ����idleѭ������TSKģ��δ��ʹ��ʱ��BIOS_start���ý����أ���ִ��IDL_loop�������õ�idleѭ������ʱӲ��������жϿ�����ռidleѭ���õ�ִ�С�����idleѭ���й����������ͨ�ţ����������Ŀ���֮������ݽ������Խ�����

�������������������ǿ��Է���һ��Ϊʲô�ڲ���ϵͳ��main��������Ҫʹ��while(1)��ѭ������Ϊ��DSP/BIOS�У�main����ֻ�Ǳ�����ϵͳ�����������г�ʼ���ģ�ִ����main�����������������ϵͳ����Ҳ������һ����ʾ�������������һ�������мȿ���ʹ�ò���ϵͳ���ֿ�����ĳЩ����¼򵥵Ľ��ò���ϵͳ��ֻ�趨��һ���꿪��main������while(1)ѭ���Ϳ����ˣ�


## DSP/BIOS��DSP��Ŀ�еĵ�λ

��ͼ��TI��˾������DSP����ܹ���

![21]

��ͼ��֪��

1. ��CSL����DSPоƬ��������������ⲿ�������������Ա��ײ�Ĵ��룬DSP/BIOS����ײ�ĵ��ȣ�����Ӧ�ò�Ĺ�������Driverģ�飬����Ϊ�������ķ�DSPоƬ������������USB/PCI������ӿ�

2. �м����Ҫ���㷨��صĶ�����TI�ṩ��һ��DSP�㷨�ı�׼��ֻҪ���ñ�׼��д���㷨�ܺ����׵�ʵ�ֲ�ͬDSP֮�����ֲ

3. ���ϲ����Ӧ�ó�����

�����TI��DSP�߶˴����ϵ��ε���������ܹ���

## �ο�����

1. SPRU430S: TMS320C6000 DSP/BIOS 5.x Application Programming Interface (API) Reference Guide
2. SPRU423F: TMS320 DSP BIOS User Guide
3. SPRU616A: DSP-BIOS Driver Developer's Guide
4. ����ï��DSP/BIOS����
	


[1]:../images/DSP-BIOSʹ������/1.png
[2]:../images/DSP-BIOSʹ������/2.png
[3]:../images/DSP-BIOSʹ������/3.png
[4]:../images/DSP-BIOSʹ������/4.png
[5]:../images/DSP-BIOSʹ������/5.png
[6]:../images/DSP-BIOSʹ������/6.png
[7]:../images/DSP-BIOSʹ������/7.png
[8]:../images/DSP-BIOSʹ������/8.png
[9]:../images/DSP-BIOSʹ������/9.png
[10]:../images/DSP-BIOSʹ������/10.png
[11]:../images/DSP-BIOSʹ������/11.png
[12]:../images/DSP-BIOSʹ������/12.png
[13]:../images/DSP-BIOSʹ������/13.png
[14]:../images/DSP-BIOSʹ������/14.png
[15]:../images/DSP-BIOSʹ������/15.png
[16]:../images/DSP-BIOSʹ������/16.png
[17]:../images/DSP-BIOSʹ������/17.png
[18]:../images/DSP-BIOSʹ������/18.png
[19]:../images/DSP-BIOSʹ������/19.png
[20]:../images/DSP-BIOSʹ������/20.png
[21]:../images/DSP-BIOSʹ������/21.png
[22]:../images/DSP-BIOSʹ������/22.png
[23]:../images/DSP-BIOSʹ������/23.png

