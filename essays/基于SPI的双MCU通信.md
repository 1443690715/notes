[<font size=4>��������Ŀ¼<font>](../README.md)
</br></br></br>

## ����ͨ��֡��ʽ

SPIͨ�ŵ�������ֻ�ǻ����ĵײ㣬Ҫ��֤ͨ������Ư�������ͨ�ŵ�֡��ʽ����󽵵ʹ�����ʡ����磬��Ϊ����ʱ��ഫ��һ���֣�16bit�������ݣ��������7�ֽڵ�֡��ʽ��

![Frame]

��֡��ʽ��Ӧ�����ݽṹ����һ���ṹ�壺

```c
struct st_msg_user {
    uint8_t header;
    uint8_t type;
    uint8_t low_byte;
    uint8_t high_byte;
    uint8_t rsvd0;
    uint8_t rsvd1;
    uint8_t checkout;   // low_byte ^ high_byte 
};
```

Ȼ�����ж�֡�Ĳ�������ᵽ������ṹ��Ĳ������磺

```
extern struct st_msg_user assemble_frame(uint8_t type, uint16_t data);  // ���������һ֡
extern void msg_printf(struct st_msg_user *msg);                        // ��֡���ͳ�ȥ
extern uint16_t unpack_frame(struct st_msg_user msg);                   // ���֡�е�����
```

## SPI���ӻ�����ע������

���ȿ���Ӳ����Ҫע��ģ�

1.	��������1��MCUΪ��������1��Ϊ�ӻ������߽�����CLK��MISO��MOSI��SELһһ��Ӧ���ӡ�ע����һһ�Խӣ�Ҳ����˵����MISO�ͽӵ��ӻ���MISO������MOSI�ͽӵ��ӻ���MOSI

2.	����Ҫ��SPI��4�������⣬���������ӵ��ߣ����أ����ṩ�ο�����

��������ϣ�

1.	CLK��Զ����������������˱���ʹ��ȫ˫��ģʽ���ڶ����ݵ�ʱ��ͬʱдһ�������ṩ����ʱ��

2.	ʱ�ӵĿ���״̬��ʱ�ӵĲ����ص����ӻ�����Ҫ����һ��

3.	��ʹ�õ���TMS320C6713��STM32����SPIͨ�ţ�DSPΪ������ARMΪ�ӻ��������˵��������£�

	- ARM��
	
	![ARM]

	����Ӱ��ͨ�����ݵĶΰ�����Datasize��CPOL��CPHA�ֱ��ʾʱ�ӿ���״̬��ʱ�Ӳ������أ����ӻ�����һ�£�FisrtBitҲ����Ҫ��������յ��������ǵ�ת�ģ���Ϊ�ҵ�DSP��MSB��ʽ������ARM��Ҳ���MSB��
	
	- DSP��

	DSP��ʹ��McBSPģ��SPI�������ܣ���Ĵ����������£�

	```c
	/*
	 * Config SPI
	 * devNum -- Choose from 0~1 for McBSP0/McBSP1
	 */
	void SPI_Config(MCBSP_Handle *hMcbsp_ch, int devNum)
	{
		*hMcbsp_ch = MCBSP_open(devNum, MCBSP_OPEN_RESET);
		MCBSP_reset(*hMcbsp_ch);

		/* Configure using structure @SPI_McbspConfig which defined above */
	    SPI_McbspConfig.spcr = MCBSP_SPCR_DEFAULT 
	        | (0 << _MCBSP_SPCR_DLB_SHIFT )      // �ػ�����
	        | (3 << _MCBSP_SPCR_CLKSTP_SHIFT);   // CLK_STP=11
	    SPI_McbspConfig.rcr  = MCBSP_RCR_DEFAULT // (1)Single phase frame (2)Frame len=8bit 
	        | (1 << _MCBSP_RCR_RFIG_SHIFT     )  // ignore first pulse 
	        | (1 << _MCBSP_RCR_RDATDLY_SHIFT  ); // must be 1 
	    SPI_McbspConfig.xcr = MCBSP_XCR_DEFAULT  // (1)Single phase frame (2)Frame len=8bit 
	        | (1 << _MCBSP_XCR_XFIG_SHIFT     )  // ignore first pulse
	        | (1 << _MCBSP_XCR_XDATDLY_SHIFT  ); // must be 1
	    SPI_McbspConfig.srgr = MCBSP_SRGR_DEFAULT
	        | (1 << _MCBSP_SRGR_CLKSM_SHIFT   )  // Sample-rate generator clock <- CPU clock
	        & (~(1 << _MCBSP_SRGR_FSGM_SHIFT )) // DXR-to-XSR copy will generate FSX
	        | (MCBSP_SRGR_CLKGDV_OF(24)   << _MCBSP_SRGR_CLKGDV_SHIFT  ); // (CPU/2) / (24+1) = 4MHz
	    SPI_McbspConfig.mcr = MCBSP_MCR_DEFAULT; /* Using default value of MCR register */
	    SPI_McbspConfig.rcer = MCBSP_RCER_DEFAULT;
	    SPI_McbspConfig.xcer = MCBSP_XCER_DEFAULT;
	    SPI_McbspConfig.pcr = MCBSP_PCR_DEFAULT
	        | (1 << _MCBSP_PCR_FSXM_SHIFT     )  // FSXM driverd by FSGM bit in SRGR.
	        | (1 << _MCBSP_PCR_FSRM_SHIFT     )  // Frame-synchronization signal is generated internally by the sample-rate generator 
	        | (1 << _MCBSP_PCR_CLKXM_SHIFT    )  // Master
	        | (1 << _MCBSP_PCR_CLKRM_SHIFT    )  // CLKR is output, driverd by Sample-rate generate
	        | (1 << _MCBSP_PCR_FSXP_SHIFT     )  // SPI/SS is low active 
	        & (~(1 << _MCBSP_PCR_CLKRP_SHIFT ))  // receive at falling edge, CLKRP=0
	        & (~(1 << _MCBSP_PCR_CLKXP_SHIFT )); // transmit at rising edge, CLKXP=0  

		MCBSP_config(*hMcbsp_ch, &SPI_McbspConfig);	 
		
		SPI_Start(g_hMcbsp0);   
	}
	```

	��Ҫ���ú�ʱ��Ƶ�ʣ�����״̬���������أ�֡����

4.	���⣬���ǵ����ӻ���ʱ�Ӳ������ܴ��ڵ����⣬��ʹ��SPI����֡��ʱ�����֡��ÿ�������ֽڼ���ڶ��ݵ�ʱ�ӣ�����ͨ�Ŵ���ķ��ͣ����£���Delay��5us��

	```c
	void SPI_Write_Str(MCBSP_Handle hMcbsp_ch, const char *str, int32_t n)
	{
	    while (n > 0) {
	        while (!MCBSP_xrdy(hMcbsp_ch));
	        MCBSP_write(hMcbsp_ch, (Uint32)(*str++));    
	        n--;
			Delay_us(5);
	    }
	}
	```


## �߼������ǲɼ�SPI��������ͼ

��1֡�����ݣ�

![img1]

ǰ4���ֽڣ�

![img2]

��3���ֽڣ�

![img3]

[img1]:../images/����SPI��˫MCUͨ��/img1.png
[img2]:../images/����SPI��˫MCUͨ��/img2.png
[img3]:../images/����SPI��˫MCUͨ��/img3.png
[ARM]:../images/����SPI��˫MCUͨ��/ARM.jpg
[Frame]:../images/����SPI��˫MCUͨ��/Frame.jpg
