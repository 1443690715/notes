[<font size=4>��������Ŀ¼<font>](../README.md)
</br></br></br>

����TI�����ģ�

	The C67x FastRTS library is an optimized floating-point math function library for C programmers using TMS320C67x devices

����˵��C67x FastRTS library���Ǳ���ʹ�õ�c67xmathlib����dsp��ʹ��C��׼��math.h�ܸо���һ����Դ�˷ѣ�û���Թ���ֻ�Ǹо������в��Թ���ϣ��һ�����������ڹ���������Ҫ�õ�һЩ��ѧ��������log2��FFT�㷨�оͺܺ��ã�sin/cos�����ڽ������ε��㷨�в��ɱ��⣬��ʱΪ����ٶȣ�һ��ʹ�ò��ķ�ʽ��Ȼ�������ı׶˾��ǡ���̫�Ĵ洢�ռ��ˣ����Ҿ������ޣ�ĳЩ����²����ѻ��ڲ�������Ͻ��в�ֵ���㡣C67x FastRTS libraryǡ���ṩ��һЩ�Ż�����ѧ����֧�֣��Ƽ�ʹ�ã�

## ȥ��������

http://www.ti.com.cn/tool/cn/mathlib

�������Ǹ���ִ�г��򣬹��ƾ���һ���������Ϊ��װ������һЩ.c/h�ļ�����Ŀ¼�ṹ���£�

```
 +--mathlib_v2.0.0.1
     |
     +--docs                Library documentation
     |
     +--src                 Source code with example projects
     |   |
     |   + dp              Example projects for Double precision kernels
     |   + sp              Example projects for Single precision kernels
     |
     |--include            Header file containing kernel interface
     |                         header files
     |
     |--lib                   Precompiled Library  (COFF and ELF)
     |
     |--build               Provided project to rebuild library
     |
     |--README.txt          Top-level README file
     |
     |--Rules.make     Rules.make file for setting paths to dependencies in Linux
     |
     |--Top level make file
```

## ʹ��

��ͳ����ʹ��������ķ����ǣ�libĿ¼�µľ�̬���ӿ��includeĿ¼�µ�.hͷ�ļ���Ȼ������ΪsrcĿ¼���Ѿ�����Դ���룬����Ը������Ҫ�õ��ĺ���Դ�븴�Ƶ������б��롣

���磺ʹ��float���͵�sin������������./src/sp/sinsp/sinsp_c.c��./src/sp/sinsp/sinsp_c.h�������б��뼴��ʹ�á�

ÿ������ģ�鶼�ṩ�����ļ���

1.	����C���Ժ�����ʵ�֣���*_c.c/h�ļ��У�
2.	����inline��ʵ�֣���*_i.hͷ�ļ��У�
3.	��������/��������ʵ�֣���*_v.c�ļ��У�
4.	������֤��main������*_d.c�ļ���

����ֵ��ע���һ���ǣ���ʹ��ǰ���ʹ��CCS�ķ�������֤�º�������ȷ�ԣ���Ȼ���㹻����TI�Ļ��͵���û˵���⻰��


