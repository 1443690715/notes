[<font size=4>��������Ŀ¼<font>](./README.md)
</br></br></br>

## 1 �����֪����TMS320C6000��������

�ⲿ���������ҵ���һƪ����

[DSP TMS320C6000����ѧϰ��7������ Bootloader��VectorTable]

���ᵽ������������ժ¼һ�顣

![][reset]

����ͼ

- ��Device Reset�׶Σ��豸��ʼ��ΪĬ��״̬���󲿷���̬���������Ϊ����̬��
- ��CPU Reset�׶Σ���RS�����ش���ʼ�����ʱ��HD[4:3]��������ģʽ��HD8���ô�С��ģʽ��CLKMODE��������ʱ��Դ������HPI_EN�������蹦�ܣ����������������ģʽHD[4:3]������bootloader����

![HD43]

����ͼ���Կ�����CE1��ַ�ռ��������FlashоƬ����ʹ���ⲿFlash����ģʽ���ڵ�·���ʱҪע�⡣

��HD[4:3]=10�����ĵĲ����������ڴˣ���EDMA�Զ���CE1��ʼλ�õ�1KB���뿽�����ڲ�����洢����0��ַ���ⲿ�ֹ�������Ӳ����ɵģ���__һ������Bootloader__��

![][copy1KB]

��ˣ��ⲿFlash��������򵥵��뷨���ǣ���Ҫ���еĳ���ŵ�CE1����ʼ1KB��ַ�ռ䡣����ֻҪ����HD[4:3]=10�����������ˡ�����ô�򵥣��������۱��ĵı�Ҫ��

����������˼ά��ͣ����С���ӹ��Ҽҵĳ̶ȣ���������1KB��1KB���ܴ���ٴ��룿Ҫ�Ǵ���������1KB�أ������Ǳ���Ҫ̽�ֵ�����ĳ��ԣ�__�������>1KB�������C6713�ĳ�����ⲿFlash��������__

����漰��һ��Bootloader�ˣ����ǳ�֮Ϊ__��������Bootloader__��˵���˾���һ��С���򣩡�����Bootloader�����У���1�����ϵ縴λ���û���Ӧ�ó����Flash������RAM��ִ�У���2����ת��Ӧ�ó������ں�������

����Bootloader��ִ��Ҫ��һ��Bootloader������RAM��ִ�У���������ˣ�����Bootloader��������ⲿFlash����ʼ��1KBλ�ô���


���Ǽ�Ҫ���ø�ͼ��������ν�Ķ���Bootloader�����������̼���Ҫ˼·��

![][2levelboot]

Ҫ���������̣�

- ����Ҫ��дһ�γ�Ϊ2 Level Bootloader���������벢��д��Flash�ĳ�ʼ1KB��ַ����DSP6713��CE1��ʼ��ַΪ0x90000000����1 Level Bootloader���ô��뿽����RAM����ʼ0��ַ����ʼִ�С�
- ��д�û�����0x90000400��ʼ��Flash��ַ��
- 2 Level Bootloader��0x90000400��ʼ���û����뿽����RAM��0x400��ַ��
- 2 Level Bootloader����_c_int00�û���ڳ���Ȼ�����main������ʼִ���û�����

����_c_int00�Ľ���Ҳ��ο�[DSP TMS320C6000����ѧϰ��7������  Bootloader��VectorTable]�������в�����ǰ�������Ѿ����ú����ж������������ڵ���_c_int00ʱ������ȷ�Ľ��뵽�û����򣩡�


## 2 ��д����Bootloader 

�Ⱥ궨��һ��EMIF��صļĴ�������Ϊ����Ҫ��Flash�������ڶ���������������ǰҪ����EMIF�Ĵ�����

```asm
;
;  ======== c6713_emif.s62 ========
;
            .title  "Flash bootup utility"

; global EMIF symbols defined for the c671x family
            .include        boot_c671x.h62

;EMIF Register Addresses for c671x family  
EMIF_GCTL       .equ  0x01800000  ;EMIF global control
EMIF_CE1        .equ  0x01800004  ;address of EMIF CE1 control reg.
EMIF_CE0        .equ  0x01800008  ;EMIF CE0control
EMIF_CE2        .equ  0x01800010  ;EMIF CE2control
EMIF_CE3        .equ  0x01800014  ;EMIF CE3control
EMIF_SDRAMCTL   .equ  0x01800018  ;EMIF SDRAM control
EMIF_SDRAMTIM   .equ  0x0180001c  ;EMIF SDRAM timer
EMIF_SDRAMEXT   .equ  0x01800020  ;EMIF SDRAM extension

; EMIF Register Values specifically for 6713 DSK
EMIF_GCTL_V     .equ  0x00000078  ;
EMIF_CE0_V      .equ  0xffffff23  ;EMIF CE0 SDRAM
EMIF_CE1_V      .equ  0xffffff13  ;EMIF CE1 Flash 8-bit
EMIF_CE2_V      .equ  0xffffbf93 ;EMIF CE2 Daughtercard 32-bit async
EMIF_CE3_V      .equ  0xffffff13  ;EMIF CE3 Daughtercard 32-bit async
EMIF_SDRAMCTL_V .equ  0x53115000  ;EMIF SDRAM control
EMIF_SDRAMTIM_V .equ  0x00000578  ;SDRAM timing (refresh)
EMIF_SDRAMEXT_V .equ  0x000a8529  ;SDRAM extended control
```

�궨���EMIF�Ĵ�������Ϊȫ�ַ��ţ�.global��C�����е�externЧ��һ�£�����Ϊ�ⲿ���š�

```asm
;
;  ======== boot_c671x.h62 ========
;

	.if ($isdefed("BOOT_C671X_") = 0)  ; prevent multiple includes of this file
BOOT_C671X_	.set	1

; EMIF Register Addresses for c671x family         
        .global EMIF_GCTL         ;EMIF global control
        .global EMIF_CE1          ;address of EMIF CE1 control reg.
        .global EMIF_CE0          ;EMIF CE0control
        .global EMIF_CE2          ;EMIF CE2control
        .global EMIF_CE3          ;EMIF CE3control
        .global EMIF_SDRAMCTL     ;EMIF SDRAM control
        .global EMIF_SDRAMTIM     ;EMIF SDRAM timer
        .global EMIF_SDRAMEXT     ;EMIF SDRAM extension

; EMIF Register Values for c671x family
        .global EMIF_GCTL_V       ;
        .global EMIF_CE0_V        ;EMIF CE0 SDRAM
        .global EMIF_CE1_V        ;EMIF CE1 Flash 8-bit
        .global EMIF_CE2_V        ;EMIF CE2 Daughtercard 32-bit async
        .global EMIF_CE3_V        ;EMIF CE3 Daughtercard 32-bit async
        .global EMIF_SDRAMCTL_V   ;EMIF SDRAM control
        .global EMIF_SDRAMTIM_V   ;SDRAM timing (refresh)
        .global EMIF_SDRAMEXT_V   ;SDRAM extended control

	.endif		; if BOOT_C671X_ is not defined

```

����Ĵ������.boot_load���㽫��֮���cmd�ļ��п�������

�������ȶ�EMIF���г�ʼ����Ȼ����copy_section_top�ж�ȡ�û�����Ķ���Ϣ���ε�Flash���ص�ַ���ε�RAM���е�ַ�Լ��εĳ��ȣ�����copy_loop��ִ��ѭ������������

```asm
;A;
;  ======== File: boot_c671x.s62 ========
;
            .title  "Flash bootup utility"

; global EMIF symbols defined for the c671x family
            .include        boot_c671x.h62

; Address of the generated boot-table
user_size      .equ  0x00001798
user_ld_start  .equ  0x90000400
user_rn_start  .equ  0x00000400

            .sect ".boot_load"
            .global _boot

			.ref _c_int00
            
_boot:      
;************************************************************************
;* DEBUG LOOP -  COMMENT OUT B FOR NORMAL OPERATION
;************************************************************************

            zero B1
_myloop:  ; [!B1] B _myloop  
            nop  5
_myloopend: nop

;************************************************************************
;* CONFIGURE EMIF
;************************************************************************

        ;****************************************************************
        ; *EMIF_GCTL = EMIF_GCTL_V;
        ;****************************************************************

            mvkl  EMIF_GCTL,A4    
      ||    mvkl  EMIF_GCTL_V,B4

            mvkh  EMIF_GCTL,A4
      ||    mvkh  EMIF_GCTL_V,B4

            stw   B4,*A4

        ;****************************************************************
        ; *EMIF_CE0 = EMIF_CE0_V
        ;****************************************************************

            mvkl  EMIF_CE0,A4       
      ||    mvkl  EMIF_CE0_V,B4     

            mvkh  EMIF_CE0,A4
      ||    mvkh  EMIF_CE0_V,B4

            stw   B4,*A4

        ;****************************************************************
        ; *EMIF_CE1 = EMIF_CE1_V (setup for 8-bit async)
        ;****************************************************************

            mvkl  EMIF_CE1,A4       
      ||    mvkl  EMIF_CE1_V,B4

            mvkh  EMIF_CE1,A4
      ||    mvkh  EMIF_CE1_V,B4

            stw   B4,*A4
        
        ;****************************************************************
        ; *EMIF_CE2 = EMIF_CE2_V (setup for 32-bit async)
        ;****************************************************************

            mvkl  EMIF_CE2,A4       
      ||    mvkl  EMIF_CE2_V,B4

            mvkh  EMIF_CE2,A4
      ||    mvkh  EMIF_CE2_V,B4

            stw   B4,*A4

        ;****************************************************************
        ; *EMIF_CE3 = EMIF_CE3_V (setup for 32-bit async)
        ;****************************************************************

      ||    mvkl  EMIF_CE3,A4    
      ||    mvkl  EMIF_CE3_V,B4     ;

            mvkh  EMIF_CE3,A4
      ||    mvkh  EMIF_CE3_V,B4

            stw   B4,*A4

        ;****************************************************************
        ; *EMIF_SDRAMCTL = EMIF_SDRAMCTL_V
        ;****************************************************************
      ||    mvkl  EMIF_SDRAMCTL,A4      
      ||    mvkl  EMIF_SDRAMCTL_V,B4    ;

            mvkh  EMIF_SDRAMCTL,A4
      ||    mvkh  EMIF_SDRAMCTL_V,B4

            stw   B4,*A4

        ;****************************************************************
        ; *EMIF_SDRAMTIM = EMIF_SDRAMTIM_V
        ;****************************************************************
      ||    mvkl  EMIF_SDRAMTIM,A4      
      ||    mvkl  EMIF_SDRAMTIM_V,B4    ;

            mvkh  EMIF_SDRAMTIM,A4
      ||    mvkh  EMIF_SDRAMTIM_V,B4

            stw   B4,*A4

        ;****************************************************************
        ; *EMIF_SDRAMEXT = EMIF_SDRAMEXT_V
        ;****************************************************************
      ||    mvkl  EMIF_SDRAMEXT,A4      
      ||    mvkl  EMIF_SDRAMEXT_V,B4    ;

            mvkh  EMIF_SDRAMEXT,A4
      ||    mvkh  EMIF_SDRAMEXT_V,B4

            stw   B4,*A4

;****************************************************************************
; copy sections
;****************************************************************************
        mvkl  copyTable, a3 ; load table pointer
        mvkh  copyTable, a3

        ; ldw   *a3++, b1     ; Load entry point

copy_section_top:
        ldw   *a3++, b0     ; byte count 
		ldw   *a3++, b4     ; load flash start (load) address
        ldw   *a3++, a4     ; ram start address
        nop   2

 [!b0]  b copy_done         ; have we copied all sections?
        nop   5

copy_loop:
        ldb   *b4++,b5      ; fetch from flash
        sub   b0,1,b0       ; decrement counter
 [ b0]  b     copy_loop     ; setup branch if not done
 [!b0]  b     copy_section_top
        zero  a1
 [!b0]  and   3,a3,a1
        stb   b5,*a4++      ; store to ram
 [!b0]  and   -4,a3,a5
 [a1]   and   4, a5,a3

;****************************************************************************
; jump to entry point
;****************************************************************************
copy_done:
        mvkl .S2 _c_int00,b0
		mvkh .S2 _c_int00,b0
        b    .S2 b0
        nop   5

copyTable: 
	
			; count
			; flash start (load) address 
			; ram start (run) address
	 
    		;; .text
    		.word user_size
    		.word user_ld_start
    		.word user_rn_start    
		      		
    		;; end of table
    		.word 0
    		.word 0
    		.word 0
```

��ʹ��ʱ������Ҫ����������е�

```asm
user_size      .equ  0x00001798
user_ld_start  .equ  0x90000400
user_rn_start  .equ  0x00000400
```
�����޸ģ�user_size��ʾ�û�����ε��ֽڴ�С��user_ld_start��ʾ�û������Flash��ʼ��ַ����Ĭ��ʹ��0x90000400��һ�㲻�ģ���user_rn_start��ʾ�û�����Ҫ��ŵ�RAM����ʼ��ַ����֮ǰ��ͼ���������Ҳһ�㲻�ģ���С������һ��ֻ�޸��û�����ε��ֽڴ�С����������Ҫ��copyTable�����Ʊ����е�����

Ҫ��������ĵ�ַ�ķֲ����޸��û�Ӧ�ó����cmd�ļ����£�

```
-c
-x
-l rts6700.lib
-heap  100h
-stack 200h
MEMORY
{
    BOOT_RAM   : o=00000000h,l=00000400h
    IRAM       : o=00000400h,l=00040000h
	FLASH_BOOT : o=90000000h,l=00000400h
	FLASH_REST : o=90000400h,l=000FFB00h
}
SECTIONS
{
      .boot_load:> BOOT_RAM

	  /* Initialized User code section */
	  .text     :> IRAM
	  .cinit    :> IRAM

      .vectors  :> IRAM
      .bss		:> IRAM
      .far    	:> IRAM
      .stack  	:> IRAM
      .const    :> IRAM
      .switch   :> IRAM
      .sysmem   :> IRAM
      .cio      :> IRAM   
}
```

ע�����е�.boot_load�Σ���������������.sect ".boot_load"��Ӧ������û�Ӧ�ó������������ĶΣ��ɶ�cmd�ļ�����Ӧ�޸ģ���.boot_load:> BOOT_RAM���ܸģ��Ҳ�Ҫ�������η���BOOT_RAM�洢���С�

������3������ļ���һ��cmd�ļ��ӵ��û�����Ĺ��������±��빤�̡�


## 3 ��ȡҪ��д�Ķ���������

�ⲿ���Ǵ��ֹ��������ʹ��VIM�������ݴ��������ͼ򵥶��ˡ�

���ȣ���Jtag������TMS320C6713�����壬�����û�Ӧ�ó���ʹ��CCS V3.3��File->Data->Save...���ܣ����ڴ��еĶ����ƵĴ������ݱ��浽.dat�ļ���

![][storedat]

Address���������cmd�ļ��趨�õġ�

Ҫ�����*.dat���������ļ���һ����Ŷ���Bootloader�Ļ����������루boot.dat����һ������û�Ӧ�ó���Ķ������루text.dat��

- boot.dat: Address=0x00000000, Length=0x00000100
- text.dat: Address=0x00000400, Length=?

ร��û�����ĳ�����ô֪�������У�����˵һ��Bootloader�´��1KB������������ô��Length=0x00000100?

�뵽CCS���̵�DebugĿ¼�´�.map�ļ�������ͼ������ϸ�Ľ������ͼ��ע���С�

![][map]

���ˣ�����ҿ���������boot.dat�ļ���

![][bootdat]

���˵�һ�У�ÿ�ж���һ��4�ֽڳ��ȵ���������Ҫ�����ǣ��ֱ��boot.dat����Щ����text.dat�е���Щ���ŵ�boot[]��text[]�������У��������鱣����ͷ�ļ��С�

���ˣ����ý��ˣ���Ҹ��Ա��������ݵĸ�ʽ������ɣ������ҵ�VIM�༭�������ɸ㶨��

- ����ɾ��ͷ��
- vim������Ӷ���:%s/$/,/g
- ���������

�㶨��Ľ������boot.h�ļ���text.h�ļ����£�

![][booth] ![][texth]

���ˣ�����Ͳ���ˣ���ʾ������Ķ�������񱣴������ǵ�C����ͷ�ļ����ˣ��������Ҫ��ͷ�ļ������еĻ�������д��Flash�Ķ�Ӧ�ĵ�ַ�ռ䡣


## 4 ��дFlash 

���Ĳ���������ʹ�õ�Flash�ͺ���AM29LV800BT��

Ϊ����д��������Ҫ�����������½�һ������Flash��д�Ĺ��̡�

��дFlash�ĳ�������Ҳ�кིܶ�⣬�������дFlash���˳������͵�����Ҹ��������ҵ�Flash���������������

```c
/*
 * FileName : FLASH.h
 * Author   : xiahouzuoxin
 * Date     : 2013.09.28
 * Version  : v1.0
 * Brief    :  
 */
#ifndef _FLASH_H
#define _FLASH_H

#include "Config.h"

#define		FLASH_UL1           0xAA
#define		FLASH_UL2           0x55
#define		FLASH_UL3           0x80
#define		FLASH_UL4           0xAA
#define		FLASH_UL5           0x55
#define		FLASH_SECTOR_UL6    0x30
#define		FLASH_CHIP_UL6	    0x10
#define		FLASH_PROGRAM       0xA0
#define		SECTOR_SIZE         0x0800
#define		BLOCK_SIZE          0x8000
#define		CHIP_SIZE           0x40000

#define     FLASH_FIRST_ADDR    0x90000000
#define     FLASH_OFFSET(addr)  (FLASH_FIRST_ADDR+(addr)<<1)  // 16 bit boot mode
			

/* External functions propotype */
extern uint32_t Flash_Erase(uint32_t addr,uint16_t type);
extern void Flash_Readm(uint32_t addr,uint16_t *ptr,uint32_t length);
extern uint32_t Flash_Reads(uint32_t addr);
extern void Flash_Writem(uint32_t addr,uint16_t *ptr,uint32_t length);
extern void Flash_Writes(uint32_t addr,uint16_t data);

#endif
```

```c
/*
 * FileName : FLASH.c
 * Author   : xiahouzuoxin
 * Date     : 2013.09.28
 * Version  : v1.0
 * Brief    :  
 */
#include "FLASH.h"
#include "stdio.h"

/* Global vaiables */
volatile uint16_t *FLASH_5555 = (volatile uint16_t *) (0x90000000+(0x5555<<1));
volatile uint16_t *FLASH_2AAA = (volatile uint16_t *) (0x90000000+(0x2AAA<<1));

/* 
 * @brief  Flash erase function.
 * @param  addr: 
 *         type:
 * @retval 
 */   
uint32_t Flash_Erase(uint32_t addr, uint16_t type)
{
	uint32_t i,j;

	*FLASH_5555 = FLASH_UL1;	//first
	*FLASH_2AAA = FLASH_UL2;	//second
	*FLASH_5555 = FLASH_UL3;	//third
	*FLASH_5555 = FLASH_UL4;
	*FLASH_2AAA = FLASH_UL5;

	switch(type)
	{
		case 0x50:		//block erase
			*(uint16_t *)addr = type;
			while((*(uint16_t *)addr & 0x80) != 0x80);
			for(i = 0; i < BLOCK_SIZE; i++)
			{
				if(*(uint16_t *)(addr + i) != 0xffff)
				{
					j = 0;
					break;
				}
			}
			j = 1;
			break;
		
		case 0x30:		//sector erase
			*(uint16_t *)addr = type;
			while((*(uint16_t *)addr & 0x80) != 0x80);
			break;
			
		case 0x10:		//chip erase
			*FLASH_5555 = type;
			while((*FLASH_5555 & 0x80) != 0x80);
			break;
		
		default:
			break;
	}
	return (j);
}

/* 
 * @brief  Write a single data.
 * @param  addr: 
 *         data:
 * @retval 
 */   
void Flash_Writes(uint32_t addr,uint16_t data)
{
	uint32_t j = 0;

	*FLASH_5555 = FLASH_UL1;
	*FLASH_2AAA = FLASH_UL2;
	*FLASH_5555 = FLASH_PROGRAM;

	*(uint16_t *)addr = data;

	j = 0;
	while (j<255) j++;  // with delay

	while(*(uint16_t *)addr != data);  // У��
}

/* 
 * @brief  Write the certain length data.
 * @param  addr: 
 *         ptr:
 *         length:
 * @retval 
 */ 
void Flash_Writem(uint32_t addr,uint16_t *ptr,uint32_t length)
{
	uint32_t i;

	for(i  = 0; i < length; i++)
	{
		Flash_Writes(addr+(i<<1),*(ptr+i));

		if (i % 0xFF == 0) {  
			printf("\nWrite %d bytes...", i<<1);
		}
	}
}

/* 
 * @brief  Read a single data.
 * @param  addr: 
 * @retval 
 */
uint32_t Flash_Reads(uint32_t addr)
{
	return (*(uint16_t *)addr);
}

/* 
 * @brief  Read the certain length data.
 * @param  addr: 
 *         ptr:
 *         length:
 * @retval 
 */
void Flash_Readm(uint32_t addr,uint16_t *ptr,uint32_t length)
{
	uint32_t i;
	for(i = 0; i < length; i++)
	{
		*(ptr + i) = Flash_Reads(addr+2*i);
	}
}
```

��ʹ�õ�Flash_Writem������ÿ��16λ��2�ֽڣ���д��������main�е���д������

```c
#include <c6x.h>
#include <csl.h>
#include <stdio.h>
#include <stdlib.h>
#include "Flash.h"
#include "BSP.h"
#include "boot.h"
#include "text.h"

main()
{
    /* Init PLL EMIF ... */
	BSP_init();

	/* Fetch data from file */

    /* Erase flash memory. */
    Flash_Erase(0x90000000,0x10);
	printf("\nErase Flash ok.");
	
    /* Write flash memory. */
	Flash_Writem(0x90000000, (uint16_t *)boot, sizeof(boot)<<1);   
    printf("\nWrite .boot ok.");

   	Flash_Writem(0x90000000+(0x200<<1), (uint16_t *)text, sizeof(text)<<1);
    printf("\nWrite .text ok.");

	printf("\nBurn to flash ok.");
}
```

ע�������Flash_Writem���ø�ʽ������boot_loader����д��Flash��ʼ��ַΪ0x90000000�ĵ�ַ�ռ䣬�û�Ӧ�ó�����д��Flash��ʼ��ַΪ0x90000400�ĵ�ַ�ռ䡣

��д�ɹ����뿴���ģ�

![][Burn]

������д������ο�[2]������������д�����õ�CCS���̣���д��ͬ��Ӧ�ó���ֻ��Ҫ�滻�����text.h��boot.h���ɡ�


## 5 �ο�

[1] Creating a Second-Level Bootloader for FLASH Bootloading on TMS320C6000 Platform With Code Composer Studio

[2] [My Flash burn CCS project][burnflash]


[DSP TMS320C6000����ѧϰ��7������ Bootloader��VectorTable]:http://blog.csdn.net/xiahouzuoxin/article/details/9713461


[reset]:../images/TMS320C6713��дFlash��ͨ�÷���/reset.jpg
[copy1KB]:../images/TMS320C6713��дFlash��ͨ�÷���/copy_1KB.jpg
[HD43]:../images/TMS320C6713��дFlash��ͨ�÷���/HD43.png
[2levelboot]:../images/TMS320C6713��дFlash��ͨ�÷���/2levelboot.png
[storedat]:../images/TMS320C6713��дFlash��ͨ�÷���/store_dat.png
[map]:../images/TMS320C6713��дFlash��ͨ�÷���/map.png
[bootdat]:../images/TMS320C6713��дFlash��ͨ�÷���/boot_dat.png
[booth]:../images/TMS320C6713��дFlash��ͨ�÷���/booth.png
[texth]:../images/TMS320C6713��дFlash��ͨ�÷���/texth.png
[Burn]:../images/TMS320C6713��дFlash��ͨ�÷���/Burn.png
[burnflash]:../codes/TMS320C6713��дFlash��ͨ�÷���/burn_flash