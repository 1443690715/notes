[<font size=4>��������Ŀ¼<font>](../README.md)
</br></br></br>

# 1 С٩GCC

����ʽʹ��gcc֮ǰ����������٩٩gcc��ɶ�������

### ��ʷ

���ڵ�GCC��GNU Compiler Collection�ļ�ƣ���Ȼ��Collection������ָһЩ�������ļ��ϡ�

�����GCC����ʱ��ֻ��C��������GCC����GNU C Comiler�ļ�д������Richard Stallman�����ģ�StallmanҲ��GNU���̵��״��ߣ���ʱ������1984�ꡣ

���ų���������Եķ�չ��GCC�𽥿�ʼ֧��C����֮������ԣ���C++��Objective-C��Java��Fortran�Լ�Ada�ȣ���ϸ�ɷ���GCC��ҳ[http://gcc.gnu.org/][GCC]

GNU������������

1. GNU Compiler Collection(GCC)������GCC��ָ���������������ӵ���������
2. GNU Make������͹������̵��Զ������ߣ���Makefile
3. GNU Binutils�������ƹ��ߣ������������ͻ����
4. GNU Debugger(GDB)��������gcc�µ��Թ���
5. GNU Autotools�����Թ���Makefile
6. GNU Binson

������Ҫ����gcc��gdb��Makefile��ʹ�á�

���⣬����ָ��gcc�����������ڱ���c++�Ĺ��ߣ�����ʵ��ʹ�õ�g++�����������̵��õ�����C����gcc��ͬ�Ĺ��ߣ�ֻ�������ӹ���������ͬ����������˵����gcc�����ʹ��g++������Ҳ�����á�

### ��װ

GCC�汾�Ƚ϶࣬����Ӧ����Ƕ��ʽARM��AVR��ƽ̨�Ľ�����빤�ߣ���RHEL/CentOS Linux�£�ֻҪʹ��
```Shell
yum install gcc
yum install g++
yum install gdb
``` 
Ĭ�������һ���ǰ�װ�õġ�

��Window�£���ѡ���gcc��װ��ʽ����[MinGW][MinGW]��[Cygwin][Cygwin]�����ĵĲ��������ͻ���Cygwin��Cygwin��һ��Window��ģ��Linux�����Ŀ�Դ�����������ʹ��gcc��gdb�ȹ����⣬����ʹ���������Shell���������ʽ��Linux�µ��ն���̫�����𡣱��ĺ��潲���������в������ǻ����ն˵ġ�


### �汾������

��װ���˹��ߺ�ʹ��
```Shell
gcc --version
gdb --version
```
�ɷֱ�鿴gcc��gdb�İ汾��Ϣ��

![][gcc-v]

���ʹ������ģ�
```Shell
gcc --help
gdb --help
g++ --help
```
������������ù���gcc�Լ�gdb�İ�����Ϣ����ʹ��gccʱż��������һ�����������⼸������ͷǳ����á�
```Shell
man gcc
man gdb 
man g++ 
```
������㿴��������������ô�鷳�Ļ�����[http://linux.die.net/man/1/gcc][gcc-man]Ҳ���Ի��gcc�İ�����Ϣ��


# 2 GCC��ʹ��

�ðɣ��������ڿ�ʼ��һ�����ӣ���ֻ��ϤC���ԣ������������۵����Ӷ���C���Ե����ӣ���

������ѧϰC����ʱ�ĵ�1�����ӡ���Hello, world!��ֻ����������Ǹ�Ӧ��˵Hello, GCC��
```C
#include <stdio.h>
int main(void)
{
    printf("Hello, world.\n");
    printf("Hello, GCC.\n");

    return 0;
}
```
���Ǿͽ�����ĳ���洢��main.c���ļ��У������������������ɣ�
```Shell
gcc main.c
ls
```
����ls������㿴����ʲô��main.cĿ¼�¶��˸�a.exe�ĳ���Linux�¿�ִ�г�����a.out�����ðɣ���Ȼ����exe��ʽ�����аɣ�
```Shell
./a.out
```
����ʲô��û��Hello, GCC.

> NOTES:    
> ��Linux/Cygwin��ִ�г���ʹ��"./��ִ���ļ���"��Ĭ�ϲ�����ʱ��ִ���ļ���Ϊa.out��a.exe��

���ˣ���͸�˵�����Ѿ���ʹ��gcc�ˣ�Ȼ������ʵ�㻹��Զ�ˣ�

1. ��֪����ô���ɻ���ļ���
2. ��֪����ô����c++�ļ���
3. ��֪����ô�鿴Ԥ����֮��Ľ����
4. �㿴VC++���˼Ҷ����������*.obj���ļ�����֪����ôʹ��gcc����õ���
5. ��֪����ô�������ļ���
6. ��֪���������ܵ�����
7. ����

����������֪�������ż�����Go on��

����֮ǰ��������˽�C�������ɿ�ִ���ļ��Ĺ��̣���4����Ԥ�������롢��ࡢ���ӡ�

![][gcc-process]

### gcc���ɿ�ִ���ļ��Ĺ���

����Hello, GCC�����ӣ�����������
```Shell
gcc main.c -o main
```
**-o** ѡ���ʾ����Ŀ���ļ���Ϊmain.exe��

```Shell
gcc -E main.c -o main.i
```
**-E** ѡ���ʾԤ���������Ԥ������ǽ��궨��չ����ͷ�ļ�չ����Ԥ����֮���Ŀ���ļ�������main.i����ʱ������Բ鿴main.i��Ԥ��������
```Shell
cat _main.c
```

```Shell
gcc -S main.c -o main.s
```
**-S** ѡ���ʾ������������������ɻ���ļ���*.s�ļ�������ʹ��-oѡ���Ŀ���ļ�Ϊmain.s��������Ҳ���Բ鿴��������Hello����Ļ����룬
```C
	.file	"main.c"
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "Hello, world.\12\0"
LC1:
	.ascii "Hello, GCC.\12\0"
	.text
.globl _main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	andl	$-16, %esp
	movl	$0, %eax
	addl	$15, %eax
	addl	$15, %eax
	shrl	$4, %eax
	sall	$4, %eax
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	call	__alloca
	call	___main
	movl	$LC0, (%esp)
	call	_printf
	movl	$LC1, (%esp)
	call	_printf
	movl	$0, %eax
	leave
	ret
	.def	_printf;	.scl	3;	.type	32;	.endef
```
��DSP��ARM��Ƕ��ʽƽ̨�ϣ�ʹ��gcc����õ���࣬�ٸ��ݻ���������Ż���һ�ֳ��õķ�����

> NOTES:	
> ���ɻ���ļ���������������ļ����Ĺ����Ǳ��룬���ǻ�࣬����ǽ�������ת����Ŀ���ļ�*.obj�Ĺ��̡�
> ���������⣬����ļ����ɿ�ִ���ļ��Ĺ�����û�б�������ġ�

```Shell
gcc -c main.c -o main.obj  
```
**-c** ѡ�Դ�ļ�����Ŀ���ļ�main.obj��main.obj��ʵ�Ѿ���һ�ֽ��ƿ�ִ���ļ��ˣ�ͨ�����Ӳ���������Ӧ�Ŀ�Ϳ���ִ���ˡ�


��4��������ֱ��ʹ��gcc main.c -o main�Ϳ�����ɡ�

### gcc�ǹ��ߵļ���

������������㽫����ֱ�۵Ŀ�����gcc��ʵ��һ�״�Ԥ�������롢��ൽ���ӹ��ߵļ��ϡ�
```Shell
rm main.i main.s main.obj 
cpp main.c > main.i
gcc -S main.i
as main.s -o main.o
```
����ֱ�ʹ����cppԤ����gcc���롢as��ࡣ���ӿ���ʹ��ld���������������Щ��

��ˣ�gccֻ�ǰ����ǽ�������ӵĲ�������һ�������У������ǵ�����������̱�ø��Ӹ�Ч�Զ�����

### gcc��һЩ����ѡ��

* -C ֻ�����-Eʹ�ã�����Ԥ��������Ҫ����ע��.
```Shell
gcc -E -C main.c -o main.i  
```
* -M ����Ԥ���������һ���ʺ�make�Ĺ���,����������Ŀ���ļ���������ϵ.
```Shell
gcc -M main.c -o main_makerule
cat main_makerule
```
```
main.o: main.c /usr/include/stdio.h /usr/include/_ansi.h \
  /usr/include/newlib.h /usr/include/sys/config.h \
  /usr/include/machine/ieeefp.h /usr/include/sys/features.h \
  /usr/include/cygwin/config.h \
  /usr/lib/gcc/i686-pc-cygwin/3.4.4/include/stddef.h \
  /usr/lib/gcc/i686-pc-cygwin/3.4.4/include/stdarg.h \
  /usr/include/sys/reent.h /usr/include/_ansi.h /usr/include/sys/_types.h \
  /usr/include/machine/_types.h /usr/include/machine/_default_types.h \
  /usr/include/sys/lock.h /usr/include/sys/types.h \
  /usr/include/machine/types.h /usr/include/cygwin/types.h \
  /usr/include/sys/sysmacros.h /usr/include/stdint.h \
  /usr/include/endian.h /usr/include/bits/endian.h \
  /usr/include/byteswap.h /usr/include/sys/stdio.h \
  /usr/include/sys/cdefs.h
```
* -w ��ֹ�������͵ľ��棬���Ƽ�ʹ��
* -Wall ��ʾ�������͵ľ��棬�Ƽ�ʹ�ã���������Լ��ĳ����ø��ӹ淶��
* -v ��ʾ������̵���ϸ��Ϣ��Verbos���
* -llibrary  ������Ϊlibrary�Ŀ��ļ�.
* -Idir  ��ͷ�ļ�������·���б������dirĿ¼
* -Ldir  ��`-llibrary'ѡ�������·���б������dirĿ¼. 

> NOTES:    
> �ڴ󹤳̱������ӹ����У��ܶ������ڡ�Undefined ...���Ĵ�������-llibrary��-Idir��-Ldir�����ô�����ɵġ�

* -Dname �궨��ĳ��name�꣬�������ȫ�ֵģ��ڿ��Ƴ����Ϻ��а���
����������main.cԴ����ͨ��_DEBUG����Կ����Ƿ��ӡ�����
```c
	#include <stdio.h>
	int main(void)
	{
	    int a = 2;
	    int b = 3;
	    int c = a + b;

	#ifdef _DEBUG
	    printf("c=%d\n", c);
	#endif
	    return 0;
	}
```
�Ա�����ʹ�úͲ�ʹ��-D_DEBUG�����н��
```
	gcc -D_DEBUG main.c -o main 
	./main 
	gcc main.c -o main 
	./mian
```
* -O/O1 �����Ż������ڴ������Ż�����ռ����΢���ʱ����൱����ڴ�
* -O2 ���Ż�һЩ.�����漰�ռ���ٶȽ������Ż�ѡ��,ִ�м������е��Ż�����.���粻����ѭ��չ��(loopunrolling)�ͺ�����Ƕ(inlining).��-Oѡ��Ƚ�,���ѡ��������˱���ʱ��,Ҳ��������ɴ���� ����Ч��.
* -O3 �Ż��ĸ���.���˴�-O2������һ��,��������-finline-functionsѡ��.

* -g �Բ���ϵͳ�ı��ظ�ʽ(stabs,COFF,XCOFF,��DWARF)����������Ϣ. ֻ��ʹ����-g����ʹ��gdb���߽��е���
```
gcc -g main.c -o main 
gdb main 
```
�й�gdb�Ĳ����кܶ࣬��ר��������

### ���ļ�����

�ðɣ�����д�����ļ�С����Example2��

_main.c_
```C
#include <stdio.h>
#include "add.h"

int main(void)
{
    int a = 2;
    int b = 3;
    int c = add(a,b);

#ifdef _DEBUG
    printf("c=%d\n", c);
#endif
    return 0;
}
```

_add.c_
```C
int add(int a, int b)
{
    return (a+b);
}
```

_add.h_
```C
#ifndef _ADD_H
#define _ADD_H

extern int add(int a, int b);

#endif
```

ʹ��gcc������ļ��ķ����ǽ����Դ�ļ���ӵ�gcc����ѡ���У�
```Shell
gcc -D_DEBUG main.c add.c -o main 
./main 
```
��ʾ����ִ�н����

![][prog-2]

> NOTES:  
> ����δ��add.h��ӵ������ļ�������Ϊ��C���Եı�������.c�ļ�Ϊ��λ�ģ�ÿ��.c�ļ���������Ӧ��һ��.s��.obj�ļ�����.h�ļ����ᡣ������������У�����ֻҪ��
> ֤��main.c�ڱ����ʱ���ܹ��ҵ�add����������ͨ��#include "add.h"ʵ�ֵġ������ӵ�ʱ��main.obj���Զ��ҵ���add.obj�е�add���ţ��ⶼ���������Ĺ��͡�


### ������뾲̬��

��ʱ����õ�Ŀ���ļ���һ�������������ʱ�����ص������У���Ϊ�����;�̬�⡣��֮ǰʹ�õ���printf������ڿ�libc�У�����ֻҪ����stdio.h����ʹ���ˣ���ʵ��Ҫ��gcc��ʹ��-llibrayѡ�ֻ����gccĬ�ϰ����˸�ѡ���

* ��̬�⣺��Linux����.a�ļ�����Windows����.lib�ļ���__������ʱ���û�������ʹ�õ��ⲿ���������뿽���������ִ����__��
* ����⣺��Linux����.so�ļ�����Windows����.dll�ļ���������ʱ��ֻ�ڳ����ִ��������һ�����������������������롣__�ڳ���ִ��ʱ���Ÿ�������������ⲿ�����Ļ�����__�����������ھ�̬����ŵ��Ǽ����˿�ִ�г���������Ĵ�С��ͬʱ������ͬʱ��������г�����ã�Ҳ�ܼ����ڴ�ռ䡣

	![][lib]

�����Ǿ�̬�⻹�ǹ���⣬��gccѡ���ж�Ҫʹ��-l��-L�ֱ��ƶ������Ϳ�·����

�����ϸ�add����Ϊ����˵˵��̬��͹����Ĵ�����ʹ�ã������sub������
_sub.c_
```C
int sub(int a, int b)
{
    return (a-b);
}
```

_sub.h_
```C
#ifndef _SUB_H
#define _SUB_H

extern int sub(int a, int b);

#endif
```

_main.c_
```C
#include <stdio.h>
#include "add.h"
#include "sub.h"

int main(void)
{
    int a = 2;
    int b = 3;
    int c = add(a,b);
    int d = sub(a,b);

#ifdef _DEBUG
    printf("c=%d\n", c);
    printf("d=%d\n", d);
#endif
    return 0;
}
```

* ��̬���������Ҫʹ�õ�gcc��ar����

```
gcc -c add.c sub.c
ar -r libmymath.a add.o sub.o
```

![][static-lib]

����������ֻҪ��.a�ļ���.h�ļ������add��sub�Ϳ���������ط�ʹ���ˡ�

> NOTES:    
> ��ע����ͼ�������ڱ���main.cʱ������ӵ���̬��ģ���-lmymath -staticѡ�

֮ǰ˵������̬�����ӵĴ��������ȹ��������Ҫ���������ȿ�����̬���Ӻ�Ĵ��������Ժ����Ƚ�
![][size-static]

* ������������Ҫʹ�õ�gcc����

```
gcc -shared -fPIC add.c sub.c -o libmymath.so 
ln -s libmymath.so libmymath.dll   # Windows�²���Ҫ
gcc main.c -lmymath -L./ -o main 
```

-shared ��ʾ����⣬-fPIC ��ʾ������λ���޹صĴ��롣

![][share-lib]

> NOTES:    
> ��Linux�£���������ӵĵĿ�ִ�г���_ִ��ʱ_���ǻ�����Ҳ��������⣬��ʱ�����ַ�����
>> 1. ���԰ѵ�ǰ·������/etc/ld.so.conf��Ȼ������ldconfig�������Ե�ǰ·��Ϊ��������ldconfig��Ҫ��rootȨ�ޣ�
>> 2. �ѵ�ǰ·�����뻷������LD_LIBRARY_PATH ��

ͬ����������ʹ�ù�������ɵĿ�ִ���ļ���С��

![][size-share]

����0x9d4���˼Ҿ�̬���ܴ�С��0x990�ֽڣ�����ô˵��̬��Ҫ�ȹ������أ�

��һ����̬�����ɴ������ȹ�����ָ���ǡ���������������洢��text�Σ��������������δ�С1712Ҫ�Ⱦ�̬���1728С��

�ڶ��� ǰ��˵��������������ӳɿ�ִ���ļ���ʱ����ֱ�ӿ���Ŀ���ļ������룬�������ɷ��ű��ԣ����ű�������Ľ�����������ű�Ӧ�ô洢��data�Σ����Թ�����data�αȾ�̬��Ҫ����Ϊ���������add.c��sub.c�Ĵ��������ɵĻ����붼�ǳ�С��ʹ�ù�������ɷ��ű�ķ�������ʹ��ִ���ļ�ռ�õĴ��̿ռ�����ˡ�ֻ��һ������£�ʹ�ù����Ŀ�ִ���ļ�ռ�õĴ��̿ռ佫�Ⱦ�̬���С.


### ��·�����ļ�·���뻷������

֮ǰ�Ѿ�˵����ͨ��-I����ָ��ͷ�ļ�·����-Lָ����·����-lָ������������һ��Ҳ���������ǵ�ʹ�á�

��ôϵͳĬ�ϵ�ͷ�ļ�·���Ϳ�·���������أ�

```
cpp -v
```

���Բ鿴Ĭ�ϵ�ͷ�ļ�·��.

```
gcc -v main.c -lmymath -L. -o main
```

���-vѡ��Ϳ��Բ鿴Ĭ�ϵ�ͷ�ļ�·��.

gcc�ṩ����Ĭ�ϵĻ���������

1. PATH����ִ���ļ��Ͷ�̬�⣨.so, .dll��������·��
2. CPATH��ͷ�ļ�����·��
3. LIBRARY_PATH��������·����������̬��;�̬��


### �������ò鿴Ŀ���ļ��Ĺ���

* file

	��ʾĿ���ļ���ʽ�����л�������ϵ�ṹ��ARM����x86��

* nm

	�г�Ŀ���ļ��ķ��ű�

* ldd

	�г���ִ���ļ�������ʱ����Ҫ�Ĺ����

* size

	�г�Ŀ���ļ��нڵ����ƺʹ�С�������Ѿ�ʹ�ù��ù��ߡ�

* readelf

	��ʾelfĿ���ļ��������ṹ������elfͷ�еı�����Ϣ������size��nm���ܡ���õķ����ǲ�����-d��-h������

* objdump

	���ж����ƹ���֮ĸ����������Ƿ����.text���еĶ�������Ϣ����õĸ�ʽ��objdump -D -S filename����ʾ�������Ϣ����Ҫ�������Դ��ͬʱ��ʾ������gcc����ʱҪʹ��-gѡ�


> NOTES:
> �������еĹ��߶�����ͨ�� [toolname] --help�����صĲ���������Ϣ��


# 3 GDB��ʹ��

gdb��һ�����Թ��ߣ���gccһ����gdb�ɵ��԰���C��C++��Java��Fortran�����ȶ������ԡ�gdb��ԭʼ��������Richard M.StallmanҲ�ǿ�Դ�˶��е�һλ���伶�����

### �ڴ沼�ּ�ջ�ṹ

����㻹��֪��malloc���������ֲ�����������Ļ������㻹�������Ϊ����Ա����Ϊ�����еĶ�����κε��ڴ���䶼ֱ�ӺͿ�ִ���ļ����û��������ռ�Ĳ���ӳ���йأ�

![][mem-layout]

����ͼ��ʾ��������

- �ں�����ռ䣨�ߵ�ַ�����û��������޷����ʵ���
- �û�ջ���ֲ������洢�ĵط����ò�����Ҫ�û��ֶ���ʼ��
- ����ʱ�����ռ䣺C�⺯��һ�㶼��ӳ�䵽����
- �û��ѣ�malloc����Ŀռ�
- ��ʼ����д���������ò���ϵͳ���ڱ���ʱ��ʼ��������ȫ�ֱ�����static����������
- ֻ������Σ���ų������ĵ�ַ����������ʱ��Ҫ�������ִ�д���װ�ص��ڴ���������


### gdb����C����
����һ�γ���main.c��

```
#include <stdio.h>
int add(int a, int b)
{
    int c = a + b;
    return c;
}

int main(void)
{
    int i = 0;
    int j = 3;
    int k = add(i,j);
    printf("i=%d, j=%d, k=%d\n", i,j,k);
    return 0;
}
```

ʹ��gcc���뼰gdb���Գ���ķ������£�

```
Administrator@DADI-20131210YK /cygdrive/e/MyDesigner/Projects/notes/codes/ʵ��ѧϰgcc+gdb+make/gdb
$ gcc -g main.c -o main          ### ע������ʱʹ��-gѡ��������ɷ��ű�����gdb����

Administrator@DADI-20131210YK /cygdrive/e/MyDesigner/Projects/notes/codes/ʵ��ѧϰgcc+gdb+make/gdb
$ gdb main
GNU gdb (GDB) 7.3.50.20110821-cvs (cygwin-special)
Copyright (C) 2011 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "i686-cygwin".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /cygdrive/e/MyDesigner/Projects/notes/codes/ʵ��ѧϰgcc+gdb+make/gdb/main...don
e.
(gdb) l main                     ### ע��list�鿴����l [������/����]
16
17          return c;
18      }
19
20      int main(void)
21      {
22          int i = 0;
23          int j = 3;
24
25          int k = add(i,j);
(gdb)                            ### ע��Enter��������������鿴����
26
27          printf("i=%d, j=%d, k=%d\n", i,j,k);
28
29          return 0;
30      }
31
(gdb) b 23                       ### ע����23����Ӷϵ�
Breakpoint 1 at 0x4010d5: file main.c, line 23.
(gdb) b add                      ### ע����add���������Ӷϵ�
Breakpoint 2 at 0x401096: file main.c, line 15.
(gdb) b 29                       ### ע����29����Ӷϵ�
Breakpoint 3 at 0x401112: file main.c, line 29.
(gdb) info break                 ### ע���鿴����ӵĶϵ���Ϣ
Num     Type           Disp Enb Address    What
1       breakpoint     keep y   0x004010d5 in main at main.c:23
2       breakpoint     keep y   0x00401096 in add at main.c:15
3       breakpoint     keep y   0x00401112 in main at main.c:29
(gdb) r                          ### ע�����г���
Starting program: /cygdrive/e/MyDesigner/Projects/notes/codes/ʵ��ѧϰgcc+gdb+make/gdb/main
[New Thread 2492.0x36c]
[New Thread 2492.0x1140]

Breakpoint 1, main () at main.c:23
23          int j = 3;
(gdb) p i                        ### ע��print��ӡ����i��ֵ
$1 = 0
(gdb) n                          ### ע��next��һ�����Ѻ�����һ�����ֱ��������
25          int k = add(i,j);
(gdb) s                          ### ע��step��һ������ִ�е������ڲ���

Breakpoint 2, add (a=0, b=3) at main.c:15
15          int c = a + b;
(gdb) c                          ### ע��continue�����е��ĵ�ǰλ�ü�������ִ�У�ֱ��������һ���ϵ�
Continuing.
i=0, j=3, k=3

Breakpoint 3, main () at main.c:29
29          return 0;
(gdb) finish                     ### ע��ֱ��ִ�е���ǰ�����Ľ�β������main������������
"finish" not meaningful in the outermost frame.
(gdb) c                          ### ע��continue����ִ��
Continuing.
[Inferior 1 (process 2492) exited normally]
(gdb) q                          ### ע������ִ�н�����quit�˳�gdb

Administrator@DADI-20131210YK /cygdrive/e/MyDesigner/Projects/notes/codes/ʵ��ѧϰgcc+gdb+make/gdb
$
```

���ˣ�����ô�򵥣�ֻҪ�������ϼ��������Ϳ��Կ������ĵ�ʹ��gdb�ˡ�

gdb���кܶ�߼������ݣ�����Ŀ��Ϊ���ţ��������벻�������ָ�����û���

```
>> gdb
>> help  
```

�μ��ο�����[6]������gdb��һ�ݹٷ��ֲᡣ


# 4 ʹ��Makefile��������

Make�ǹ������̵Ĺ��ߣ�Make���߶��û���д��Makefile���н�����ʵ��ֻ��Ҫһ������Ϳ��Ա��롢�����������̡��󲿷���ϤVC++���˶�Į����Make���ߵĴ��ڣ�VC++��Make���߽�nmake���������Ϊʲôʹ��VC++���ļ�����������һ���㶨��ԭ�����ڡ�

�������ﵱȻ����ȥ����VC++��nmake����Ҫ���۵���GNU Make��Makefile��Makefile�ļ����������������̵ı��롢���ӵĹ���

### ��дMakefile

����Example2Ϊ����Դ����Ŀ¼���½�Makefile�ļ������ˣ��ļ������ǡ�Makefile����û.txt���κκ�׺����

```shell
vim Makefile
```

Makefile�ļ�����Ϊ

```
main:main.o add.o sub.o                 # Ŀ��:����
	gcc main.o add.o sub.o -o main      # ���������TAB��ͷ��

main.o:main.c
	gcc -c -D_DEBUG main.c -o main.o
add.o:add.c
	gcc -c -D_DEBUG add.c -o add.o
sub.o:sub.c
	gcc -c -D_DEBUG sub.c -o sub.o


.PHONY:clean
clean:
	-rm main *.o
```

���ˣ��ص������У�ʹ��make�����Makefile��Ч����

```shell
make 
./main 
```

ʲô���������ȷ�Ľ�����ǾͶ��ˡ����������������������Makefile��

- Makefile�ĸ�ʽ

```
Ŀ�꣺����
	�����TAB��ͷ��
```
Ŀ�������Ӻ�Ŀ�ִ���ļ����������ǹ����е����ڱ����c�ļ����������ӵ�*.o�ļ��ļ��ϣ�����gcc����Ĺ��̶��ԣ��������gcc�������ʹ�������gcc������

- ʹ��make�������Makefile�ļ����������ļ���������Makefile��makefile��������������ƣ�����Ҫʹ��make -f [filename]ָ���ļ�����ǿ�ҽ���ʹ��Makefile��Ϊ�ļ���������Linux����ѧ������ࡢ����ĸ��д����ͻ���ļ�λ�ã���

- Makefile�����ж��Ŀ�꣨main.o add.o sub.o������ֻ����һ������Ŀ�꣨main����Makefile�ļ��е�һ�������е�Ŀ�꽫ȷ��Ϊ����Ŀ�ꡣmake����Ĭ��ִ������Ŀ�꣬��ִֻ��Makefile������Ŀ�꣬ʹ��make [Target]����Ҫ��������µ�Ŀ���ļ���ʹ��

```
make clean
```

- Makefile�н���Щû���κ�����ֻ��ִ�ж�����Ŀ���αĿ�꣨clean����ʹ��.PHONY������αĿ�겻����Ϊ����Ŀ�ꡣ

- Makefile��ʹ�ñ�����Makefile�еı������ǰ��ַ����ķ�ʽ�����滻��������һЩϵͳ����ı�����

```
$^: �������������ļ�
$@������Ŀ��
$<�����������ļ��еĵ�һ�������ļ�
```

�������Դ���Makefile�ı�д���Ӷȣ�ʹ�ñ������Makefile���£�

```
CC=gcc
OBJS=main.o add.o sub.o
CFLAGS=-D_DEBUG

main:$(OBJS)
	$(CC) $(CFLAGS) $^ -o $@

main.o:main.c
	$(CC) $(CFLAGS) -c $^ -o $@
add.o:add.c
	$(CC) $(CFLAGS) -c $^ -o $@
sub.o:sub.c
	$(CC) $(CFLAGS) -c $^ -o $@

.PHONY:clean
clean:
	-rm main *.o
```	

����CC��OBJS��CFLAGS�����Զ����Makefile������$^��$@��ϵͳ����ı�����

- �����Makefile����̫���ӣ��ɲ������ټ򵥵㣬û���⣺ʹ��ģʽƥ�䡣

```
CC=gcc
OBJS=main.o add.o sub.o
CFLAGS=-D_DEBUG

main:$(OBJS)
	$(CC) $(CFLAGS) $^ -o $@

%.o:%.c
	$(CC) $(CFLAGS) -c $^ -o $@

.PHONY:clean
clean:
	-rm main *.o
```

�����Makefileʹ��%����ƥ���κηǿ��ַ�����

1. ģʽ����%.o:%.c��������ʾ�ĺ����ǣ����е�.o�ļ������ڶ�Ӧ��.c�ļ���
2. 	ģʽ����%.o:debug.h����ʾ���е�.o�ļ���������ͷ�ļ���debug.h��

�ڱ�д���ͳ���ʱ�����������е�.c������֮��Ӧ��.h�ļ������������÷���Makfile�ܳ��á�

����ģʽƥ�䣬Makefile�л�����ʹ��ͨ�����*��
�������αĿ���о�ʹ��*.o�ʹ������к�׺Ϊ.o���ļ���

- �ðɣ������������ټ򵥵㣺ʹ��Makefile���Զ��Ƶ�������ע�⣬����Լ�һЩMakefile��������㲻ע�⣬�Ϳ��ܳ�����˲��Ƽ�ʹ�á�

```
CC=gcc
OBJS=main.o add.o sub.o
CFLAGS=-D_DEBUG

main:$(OBJS)
	$(CC) $^ -o $@

main.o:
add.o:add.h
sub.o:sub.h

.PHONY:clean
clean:
	-rm main *.o
```

��ľ�У�������main.o add.o sub.oĿ��ʱ�����ʡȥ�ˣ�Makefile���Զ��Ƶ�ʹ��gcc������룬��֪��Ҫ��-D_DEBUGѡ���ô���棿�ⶼҪ�鹦��CC��CFLAGS�������㻻�ɱ�ı��������ԣ��������в�������˵��Makefile���Զ��Ƶ�����������ã���������ȷ����ȷ��

�����ǽ�ģʽƥ����Զ��Ƶ������ϵ�һ���Makefile�ļ���

```
CC=gcc
OBJS=main.o add.o sub.o
CFLAGS=-D_DEBUG

main:$(OBJS)
	$(CC) $^ -o $@

%.o:add.h sub.h

.PHONY:clean
clean:
	-rm main *.o
```

֪�㳣�֣�����̫̰�ˣ��ܼ򻯵�������OK�ˡ�

- Makefile��ע��ʹ��#��������ǰ����@��ȡ������

- ��Ŀ¼��Makefile

1. include�ɰ�������Ŀ¼��Makefile�ļ�
2. export�ɵ�����ǰMakefile�еı���������Makefileʹ��
3. VPATH��������ָ�������ļ�������Ŀ¼�����Ŀ¼��ʹ��:��������

```
VPATH = src:../headers   # ����·��Ĭ�ϰ�����ǰ·��
```
	
4. �ؼ���vpath����ָ����ĳĿ¼��ѡ��������ĳģʽƥ��������ļ�����

```
vpath %.h ../headers     # ����·��Ĭ�ϰ�����ǰ·��
```

�����ᵽ��4�����ݽ���֮���Makefileʵ���п�����

- ֪��һЩ�򵥵�Makefile��Ƕ����

����Makefile��Ƕ����������������ο�����[5].

### Makefile����ģ��ʵ��

��С�ڽ���������ͨ�õĹ���Makefileʵ��������Ϊģ��ֱ��Ӧ�õ��Լ��Ĺ����У���Щʵ������Դ�����磬ԭ���߱�����Ȩ��

�Ķ�MakefileҲ��һ�����ܣ��������ţ�̶���С˵�����������Hacker�ǣ��о�ȥ�ɣ�

- ��һ��ģ�壺����ģ����ӵ���������Ŀ¼��ָ����صı�������ʹ�ã����߻����вο�����

```
#############################################################
# Generic Makefile for C/C++ Program
#
# License: GPL (General Public License)
# Author:  whyglinux <whyglinux AT gmail DOT com>
# Date:    2006/03/04 (version 0.1)
#          2007/03/24 (version 0.2)
#          2007/04/09 (version 0.3)
#          2007/06/26 (version 0.4)
#          2008/04/05 (version 0.5)
#
# Description:
# ------------
# This is an easily customizable makefile template. The purpose is to
# provide an instant building environment for C/C++ programs.
#
# It searches all the C/C++ source files in the specified directories,
# makes dependencies, compiles and links to form an executable.
#
# Besides its default ability to build C/C++ programs which use only
# standard C/C++ libraries, you can customize the Makefile to build
# those using other libraries. Once done, without any changes you can
# then build programs using the same or less libraries, even if source
# files are renamed, added or removed. Therefore, it is particularly
# convenient to use it to build codes for experimental or study use.
#
# GNU make is expected to use the Makefile. Other versions of makes
# may or may not work.
#
# Usage:
# ------
# 1. Copy the Makefile to your program directory.
# 2. Customize in the "Customizable Section" only if necessary:
#    * to use non-standard C/C++ libraries, set pre-processor or compiler
#      options to <MY_CFLAGS> and linker ones to <MY_LIBS>
#      (See Makefile.gtk+-2.0 for an example)
#    * to search sources in more directories, set to <SRCDIRS>
#    * to specify your favorite program name, set to <PROGRAM>
# 3. Type make to start building your program.
#
# Make Target:
# ------------
# The Makefile provides the following targets to make:
#   $ make           compile and link
#   $ make NODEP=yes compile and link without generating dependencies
#   $ make objs      compile only (no linking)
#   $ make tags      create tags for Emacs editor
#   $ make ctags     create ctags for VI editor
#   $ make clean     clean objects and the executable file
#   $ make distclean clean objects, the executable and dependencies
#   $ make help      get the usage of the makefile
#
#===========================================================================

## Customizable Section: adapt those variables to suit your program.
##==========================================================================

# The pre-processor and compiler options.
MY_CFLAGS =

# The linker options.
MY_LIBS   =

# The pre-processor options used by the cpp (man cpp for more).
CPPFLAGS  = -Wall

# The options used in linking as well as in any direct use of ld.
LDFLAGS   =

# The directories in which source files reside.
# If not specified, only the current directory will be serached.
SRCDIRS   =

# The executable file name.
# If not specified, current directory name or `a.out' will be used.
PROGRAM   =

## Implicit Section: change the following only when necessary.
##==========================================================================

# The source file types (headers excluded).
# .c indicates C source files, and others C++ ones.
SRCEXTS = .c .C .cc .cpp .CPP .c++ .cxx .cp

# The header file types.
HDREXTS = .h .H .hh .hpp .HPP .h++ .hxx .hp

# The pre-processor and compiler options.
# Users can override those variables from the command line.
CFLAGS  = -g -D_DEBUG -O2
CXXFLAGS= -g -O2

# The C program compiler.
CC     = gcc

# The C++ program compiler.
CXX    = g++

# Un-comment the following line to compile C programs as C++ ones.
#CC     = $(CXX)

# The command used to delete file.
RM     = rm -f

CTAGS  = ctags
CTAGSFLAGS = --c++-kinds=+p --fields=+iaS --extra=+q -R

## Stable Section: usually no need to be changed. But you can add more.
##==========================================================================
SHELL   = /bin/sh
EMPTY   =
SPACE   = $(EMPTY) $(EMPTY)
ifeq ($(PROGRAM),)
  CUR_PATH_NAMES = $(subst /,$(SPACE),$(subst $(SPACE),_,$(CURDIR)))
  PROGRAM = $(word $(words $(CUR_PATH_NAMES)),$(CUR_PATH_NAMES))
  ifeq ($(PROGRAM),)
    PROGRAM = a.out
  endif
endif
ifeq ($(SRCDIRS),)
  SRCDIRS = .
endif
SOURCES = $(foreach d,$(SRCDIRS),$(wildcard $(addprefix $(d)/*,$(SRCEXTS))))
HEADERS = $(foreach d,$(SRCDIRS),$(wildcard $(addprefix $(d)/*,$(HDREXTS))))
SRC_CXX = $(filter-out %.c,$(SOURCES))
OBJS    = $(addsuffix .o, $(basename $(SOURCES)))
DEPS    = $(OBJS:.o=.d)

## Define some useful variables.
DEP_OPT = $(shell if `$(CC) --version | grep "GCC" >/dev/null`; then \
                  echo "-MM -MP"; else echo "-M"; fi )
DEPEND      = $(CC)  $(DEP_OPT)  $(MY_CFLAGS) $(CFLAGS) $(CPPFLAGS)
DEPEND.d    = $(subst -g ,,$(DEPEND))
COMPILE.c   = $(CC)  $(MY_CFLAGS) $(CFLAGS)   $(CPPFLAGS) -c
COMPILE.cxx = $(CXX) $(MY_CFLAGS) $(CXXFLAGS) $(CPPFLAGS) -c
LINK.c      = $(CC)  $(MY_CFLAGS) $(CFLAGS)   $(CPPFLAGS) $(LDFLAGS)
LINK.cxx    = $(CXX) $(MY_CFLAGS) $(CXXFLAGS) $(CPPFLAGS) $(LDFLAGS)

.PHONY: all objs tags ctags clean distclean help show

# Delete the default suffixes
.SUFFIXES:

all: $(PROGRAM)

# Rules for creating dependency files (.d).
#------------------------------------------

%.d:%.c
	@echo -n $(dir $<) > $@
	@$(DEPEND.d) $< >> $@

%.d:%.C
	@echo -n $(dir $<) > $@
	@$(DEPEND.d) $< >> $@

%.d:%.cc
	@echo -n $(dir $<) > $@
	@$(DEPEND.d) $< >> $@

%.d:%.cpp
	@echo -n $(dir $<) > $@
	@$(DEPEND.d) $< >> $@

%.d:%.CPP
	@echo -n $(dir $<) > $@
	@$(DEPEND.d) $< >> $@

%.d:%.c++
	@echo -n $(dir $<) > $@
	@$(DEPEND.d) $< >> $@

%.d:%.cp
	@echo -n $(dir $<) > $@
	@$(DEPEND.d) $< >> $@

%.d:%.cxx
	@echo -n $(dir $<) > $@
	@$(DEPEND.d) $< >> $@

# Rules for generating object files (.o).
#----------------------------------------
objs:$(OBJS)

%.o:%.c
	$(COMPILE.c) $< -o $@

%.o:%.C
	$(COMPILE.cxx) $< -o $@

%.o:%.cc
	$(COMPILE.cxx) $< -o $@

%.o:%.cpp
	$(COMPILE.cxx) $< -o $@

%.o:%.CPP
	$(COMPILE.cxx) $< -o $@

%.o:%.c++
	$(COMPILE.cxx) $< -o $@

%.o:%.cp
	$(COMPILE.cxx) $< -o $@

%.o:%.cxx
	$(COMPILE.cxx) $< -o $@

# Rules for generating the tags.
#-------------------------------------
ctags: $(HEADERS) $(SOURCES)
	$(CTAGS) $(CTAGSFLAGS) $(HEADERS) $(SOURCES)

# Rules for generating the executable.
#-------------------------------------
$(PROGRAM):$(OBJS)
ifeq ($(SRC_CXX),)              # C program
	$(LINK.c)   $(OBJS) $(MY_LIBS) -o $@
	@echo Type ./$@ to execute the program.
else                            # C++ program
	$(LINK.cxx) $(OBJS) $(MY_LIBS) -o $@
	@echo Type ./$@ to execute the program.
endif

ifndef NODEP
ifneq ($(DEPS),)
  sinclude $(DEPS)
endif
endif

clean:
	$(RM) $(OBJS) $(PROGRAM) $(PROGRAM).exe

distclean: clean
	$(RM) $(DEPS) TAGS

# Show help.
help:
	@echo 'Generic Makefile for C/C++ Programs (gcmakefile) version 0.5'
	@echo 'Copyright (C) 2007, 2008 whyglinux <whyglinux@hotmail.com>'
	@echo
	@echo 'Usage: make [TARGET]'
	@echo 'TARGETS:'
	@echo '  all       (=make) compile and link.'
	@echo '  NODEP=yes make without generating dependencies.'
	@echo '  objs      compile only (no linking).'
	@echo '  tags      create tags for Emacs editor.'
	@echo '  ctags     create ctags for VI editor.'
	@echo '  clean     clean objects and the executable file.'
	@echo '  distclean clean objects, the executable and dependencies.'
	@echo '  show      show variables (for debug use only).'
	@echo '  help      print this message.'
	@echo
	@echo 'Report bugs to <whyglinux AT gmail DOT com>.'

# Show variables (for debug use only.)
show:
	@echo 'PROGRAM     :' $(PROGRAM)
	@echo 'SRCDIRS     :' $(SRCDIRS)
	@echo 'HEADERS     :' $(HEADERS)
	@echo 'SOURCES     :' $(SOURCES)
	@echo 'SRC_CXX     :' $(SRC_CXX)
	@echo 'OBJS        :' $(OBJS)
	@echo 'DEPS        :' $(DEPS)
	@echo 'DEPEND      :' $(DEPEND)
	@echo 'COMPILE.c   :' $(COMPILE.c)
	@echo 'COMPILE.cxx :' $(COMPILE.cxx)
	@echo 'link.c      :' $(LINK.c)
	@echo 'link.cxx    :' $(LINK.cxx)

## End of the Makefile ##  Suggestions are welcome  ## All rights reserved ##
##############################################################
```

���Ǵ������ҵ���һ��ģ��ģ�[http://www.iteye.com/topic/774919]��ʹ�ñ��ĵĵ�Example2���ԡ�

- �ڶ���ģ�壺�������д��͹��̣�ʹ�ö��Makefile��ͨ��include��ʽ����

�����ļ�����֯��ʽΪ��

![][Makefile-Template2]

�ò�������������CSDN��һƪ���ģ���Ŀʵ��makefile��[http://blog.csdn.net/zhouyulu/article/details/8449263]����

��ɲο��ò��ģ�������Դ���о��£����а�����

����ʹ���ļ���Ϊmake.global��Makefile����ȫ�ֱ����һЩ�����趨���������£�

```
# compile macro
CC		= g++
CFLAGS	= -O2 -Wall
LDFLAGS	= -lm 
INCLUDES= -I/usr/local/include

# recursive make
.PHONY: subdirs ${SUBDIRS} cleansubdirs
subdirs: ${SUBDIRS}
${SUBDIRS}:
	${MAKE} -C $@ all

# recursive make clean
cleansubdirs:
	@for dir in ${SUBDIRS}; do \
		${MAKE} -C $$dir clean; \
	done

# dependence
%.o: %.cpp
	${CC} ${CFLAGS} ${INCLUDES} -c $< -o $@
%.o: %.cc
	${CC} ${CFLAGS} ${INCLUDES} -c $< -o $@	
```

��Ŀ���ڵ��Makefileʹ��export��include��������make.global�еı�����Ϣ�������������£�

```
# target, subdir, objects in current dir
TARGET	= test
SUBDIRS	= src
OBJECTS	= 

all:subdirs ${OBJECTS}
	${CC} -o ${TARGET} $$(find ./${SUBDIRS} -name '*.o') ${LDFLAGS} ${INCLUDES}

clean:cleansubdirs
	rm -f ${TARGET} ${OBJECTS}

# path of "make global scripts"
# NOTE, use absolute path. export once, use in all subdirs
export PROJECTPATH=${PWD}
export MAKEINCLUDE=${PROJECTPATH}/makeconfig/make.global

# include "make global scripts"
include ${MAKEINCLUDE}
```

����Ŀ¼�µ�Makefile�ȽϾ���һ���ԣ���srcĿ¼��Makefile��

```
# subdir and objects in current dir
SUBDIRS	= module-a module-b
OBJECTS	= main.o

all:subdirs ${OBJECTS}

clean:cleansubdirs
	rm -f ${OBJECTS}
	
include ${MAKEINCLUDE}
```
Ҷ�ӽڵ��Ŀ¼�£��磺

src/module-a
```
# subdir and objects in current dir
SUBDIRS	= 
OBJECTS	= test.o

all:subdirs ${OBJECTS}

clean:cleansubdirs
	rm -f ${OBJECTS}
	
include ${MAKEINCLUDE}
```

src/module-b
```
# subdir and objects in current dir
SUBDIRS	= 
OBJECTS	= test.o

all:subdirs ${OBJECTS}

clean:cleansubdirs
	rm -f ${OBJECTS}
	
include ${MAKEINCLUDE}
```

��ˣ�ֻҪ����Ŀ��Ŀ¼ʹ��һ��make��������Զ��ݹ�ĵ�������Ŀ¼�µ�Makefile���������̽��б��룬�����ʺ϶��˺�������Ŀ�С�

�Ұ����ߵ��ⲿ�ִ��������Example3ʵ���С�


# 5 �ο���Դ
1. GCC Manual "Using the GNU Compiler Collection (GCC)" @ http://gcc.gnu.org/onlinedocs.
2. GNU 'make' manual @ http://www.gnu.org/software/make/manual/make.html.
3. GCC and Make http://www3.ntu.edu.sg/home/ehchua/programming/cpp/gcc_make.html
4. Robert Mecklenburg, "Managing Projects with GNU Make", 3rd Edition, 2004.
5. GNU make�����ֲ�. ���������캣��, 2004-09-11 
6. The gnu Source-Level Debugger for gdb (GDB). https://sourceware.org/gdb/download/onlinedocs/gdb/index.html. 
7. ���ĵĴ���ʵ���� [CODES]





[GCC]:http://gcc.gnu.org/
[MinGW]:http://www.mingw.org/
[Cygwin]:http://www.mingw.org/
[gcc-man]:http://linux.die.net/man/1/gcc


[gdb]:http://www.gnu.org/software/gdb/gdb.html
[Peter's gdb]:http://www.dirac.org/linux/gdb/
[http://www.iteye.com/topic/774919]: http://www.iteye.com/topic/774919
[http://blog.csdn.net/zhouyulu/article/details/8449263]: http://blog.csdn.net/zhouyulu/article/details/8449263

[gcc-v]:../images/ʵ��ѧϰgcc+gdb+make/gcc-v.png
[gcc-process]:../images/ʵ��ѧϰgcc+gdb+make/GCC_CompilationProcess.png
[prog-2]:../images/ʵ��ѧϰgcc+gdb+make/prog-2.png
[static-lib]:../images/ʵ��ѧϰgcc+gdb+make/static-lib.png
[share-lib]:../images/ʵ��ѧϰgcc+gdb+make/share-lib.png
[size-static]:../images/ʵ��ѧϰgcc+gdb+make/size-static.png
[size-share]:../images/ʵ��ѧϰgcc+gdb+make/size-share.png
[Makefile-Template2]:../images/ʵ��ѧϰgcc+gdb+make/Makefile-Template2.png


[mem-layout]:../images/ʵ��ѧϰgcc+gdb+make/mem_layout.png


[CODES]:../codes/ʵ��ѧϰgcc+gdb+make