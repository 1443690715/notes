[<font size=4>��������Ŀ¼<font>](../README.md)
</br></br></br>


## ��MATLAB������C���Ա�����

����֮ǰ���밲װ�ñ�������������VC�����棬��ɫ��ò�Ʋ��а���

1\.	`mex �Csetup`���ñ�����ѡ�����ں���ΪmexFunction��C/C++�ļ������mex(DLL)�ļ�

```	
>> mex -setup
Please choose your compiler for building external interface (MEX) files: 
 
Would you like mex to locate installed compilers [y]/n? y
 
Select a compiler: 
[1] Microsoft Visual C++ 2008 SP1 in D:\Program Files\VS2008 
 
[0] None 
 
Compiler: 1
 
Please verify your choices: 
 
Compiler: Microsoft Visual C++ 2008 SP1  
Location: D:\Program Files\VS2008 
 
Are these correct [y]/n? y
 
*************************************************************************** 
  Warning: MEX-files generated using Microsoft Visual C++ 2008 require 
           that Microsoft Visual Studio 2008 run-time libraries be  
           available on the computer they are run on. 
           If you plan to redistribute your MEX-files to other MATLAB 
           users, be sure that they have the run-time libraries. 
*************************************************************************** 
 
Trying to update options file: C:\Users\Administrator\AppData\Roaming\MathWorks\MATLAB\R2010b\mexopts.bat 
From template:              D:\PROGRA~1\MATLAB\R2010b\bin\win64\mexopts\msvc90opts.bat 
 
Done . . . 
```

2\. `mbuild -setup`���ñ�����ѡ�����ں���Ϊmain��C/C++�ļ����ɿ��Զ������е�CӦ�ó���

```
>> mbuild -setup
Please choose your compiler for building standalone MATLAB applications: 
 
Would you like mbuild to locate installed compilers [y]/n? y
 
Select a compiler: 
[1] Microsoft Visual C++ 2008 SP1 in D:\Program Files\VS2008 
 
[0] None 
 
Compiler: 1
 
Please verify your choices: 
 
Compiler: Microsoft Visual C++ 2008 SP1  
Location: D:\Program Files\VS2008 
 
Are these correct [y]/n? y
 
**************************************************************************** 
  Warning: Applications/components generated using Microsoft Visual Studio   
           2008 require that the Microsoft Visual Studio 2008 run-time       
           libraries be available on the computer used for deployment.       
           To redistribute your applications/components, be sure that the    
           deployment machine has these run-time libraries.                  
**************************************************************************** 
 
Trying to update options file: C:\Users\Administrator\AppData\Roaming\MathWorks\MATLAB\R2010b\compopts.bat 
From template:              D:\PROGRA~1\MATLAB\R2010b\bin\win64\mbuildopts\msvc90compp.bat 
 
Done . . . 
```

## MATLAB����C�������

1.	C�������£��ļ���Ϊtest.c�����豣����E:/test�£�

	```c
	#include "mex.h"
	#include <stdio.h>
	void mexFunction(int nlhs, mxArray *plhs[], 
	                 int nrhs, const mxArray *prhs[]) 
	{
	    printf("Hello, %d\n", add(2,3));
	}
	 
	int add(int a, int b)
	{
	    return (a+b);
	}
	```
	
2.	��MATLAB������`cd E:/test`ת�����C�ļ�·����ʹ��`mex test.c`���룬Ȼ������test������Commond windows�����Hello World, 5!

3.	��C/C++�����ó���ͷ�ļ�

	```
	#include "mex.h"
	#include "matrix.h"
	```

4.	��C/C++�г�����matlab������صĺ���

	mexErrMsgTxt : ��ӡ������Ϣ�����жϳ���ִ��
	
	mxGetM/mxGetN����ȡmatlab�о��������
	
	mxGetPr : ��ȡ��������ָ��
	
	mxGetScale:��������Ϊ����ֵ�����ȡ�����ֵ
	
	mxCreateNumericMatrix/mxCreateDoubleMatrix:�����������

	```
	void
	mexFunction(int nout, mxArray *out[],
	            int nin, const mxArray *in[])
	{
		uint32 n_center;
		uint32 n_data;
		uint32 dims;
		uint32 *ids;
		datatype *data;
		datatype *center;
		optstype opts;
	
		enum {IN_CENTER=0, IN_DATA, IN_OPTS};
		enum {OUT_ASSIGN=0};
	
		/* check arguments and load data */
		if (nin < 2) {
			mexErrMsgTxt("At least two aguments required.");
	    } else if (nin < 3) {
	        opts = 1;
	    } else {
	        opts = mxGetScalar(in[IN_OPTS]);
	        if (opts > 1) {
	            mexErrMsgTxt("options must between [0:'l1' 1:'l2'].");
	        }
	    }
		if (nout > 1)
			mexErrMsgTxt("Too many output arguments.");
	
		/* load data */
		n_center = mxGetN(in[IN_CENTER]);
		dims = mxGetM(in[IN_CENTER]);
	    if (dims != mxGetM(in[IN_DATA])) {
	        mexErrMsgTxt("dimension of CENTER dismatch DATA.");
	    }
		center = mxGetPr(in[IN_CENTER]);
		n_data = mxGetN(in[IN_DATA]);	
		data = mxGetPr(in[IN_DATA]);
	
		/* output */
		out[OUT_ASSIGN] = mxCreateNumericMatrix(1, n_data, mxUINT32_CLASS, mxREAL);
		ids = (uint32 *)mxGetPr(out[OUT_ASSIGN]);
	
		kmeanspush(center, n_center, data, ids, n_data, dims, opts);
	}
	```

5.	MATLAB������C/C++����֮���ת��

	matlab�е�Ԫ��������1��ʼ����C/C++���Ǵ�0��ʼ��

	matlab�еľ�������˳���Ǵ��п�ʼ�ģ����matlab�е�a(i,j)��ת��ΪC/C++�е�a[j'][i'] (����j'=j-1, i'=i-1)


## C�������MATLAB����

1.	��дC������ʹ������ı���ѡ��
	mcc -B csharedlib:MyFunc MyFunc.m

2.	��C��������ʹ�ù����������matlab����
