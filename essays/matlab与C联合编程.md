[<font size=4>��������Ŀ¼<font>](../README.md)
</br></br></br>


## ��MATLAB������C���Ա�����
mex �Csetup       ; ����ں���ΪmexFunction��C/C++�ļ������mex(DLL)�ļ�
mbuild -setup    ; ����ں���Ϊmain��C/C++�ļ����ɿ��Զ������е�CӦ�ó���

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
