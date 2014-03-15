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



# 4 ʹ��Makefile��������




# �ο���Դ
1. GCC Manual "Using the GNU Compiler Collection (GCC)" @ http://gcc.gnu.org/onlinedocs.
2. GNU 'make' manual @ http://www.gnu.org/software/make/manual/make.html.
3. GCC and Make http://www3.ntu.edu.sg/home/ehchua/programming/cpp/gcc_make.html
4. Robert Mecklenburg, "Managing Projects with GNU Make", 3rd Edition, 2004.










[GCC]:http://gcc.gnu.org/
[MinGW]:http://www.mingw.org/
[Cygwin]:http://www.mingw.org/
[gcc-man]:http://linux.die.net/man/1/gcc


[gcc-v]:../images/ʵ��ѧϰgcc+gdb+make/gcc-v.png
[gcc-process]:../images/ʵ��ѧϰgcc+gdb+make/GCC_CompilationProcess.png
[prog-2]:../images/ʵ��ѧϰgcc+gdb+make/prog-2.png
[static-lib]:../images/ʵ��ѧϰgcc+gdb+make/static-lib.png
[share-lib]:../images/ʵ��ѧϰgcc+gdb+make/share-lib.png
[size-static]:../images/ʵ��ѧϰgcc+gdb+make/size-static.png
[size-share]:../images/ʵ��ѧϰgcc+gdb+make/size-share.png