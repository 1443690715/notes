[<font size=4>��������Ŀ¼<font>](../README.md)
</br></br></br>

## ���򼰷���

```c
/*
 * FileName : contrast.cpp
 * Author   : xiahouzuoxin @163.com
 * Version  : v1.0
 * Date     : Tue 29 Jul 2014 08:09:57 PM CST
 * Brief    : 
 * 
 * Copyright (C) MICL,USTB
 */
#include <cv.h>
#include <highgui.h>
#include <iostream>


using namespace cv;
using namespace std;

int main(int argc, char *argv[])
{
    float alpha = 0;
    int   beta  = 0;
    Mat   image;
    Mat   result;

    if (argc<2) {
        cout<<"Usage:./contrast [image_name]"<<endl;
        return -1;
    }

    image = imread(argv[1]);
    if (!image.data) {
        cout<<"Read image error."<<endl;
    }

    cout<<"Enter alpha value[1-3]:"<<endl;
    cin>>alpha;
    cout<<"Enter beta value[0-100]:"<<endl;
    cin>>beta;    

    result.create(image.size(), image.type()); 

    int n = image.rows * image.cols * image.channels();
    uchar *p = image.data;
    uchar *q = result.data;
    for (int i=0; i<n; i++) {
        *q++ = saturate_cast<uchar>(alpha * (*p++) + beta);     
    }

    namedWindow("origin", CV_WINDOW_AUTOSIZE);
    imshow("origin", image);
    namedWindow("result", CV_WINDOW_AUTOSIZE);
    imshow("result", result);

    waitKey(0);

    return 0;
}
```

1.	�õ�Mat::create��Ա�������ڶ�Mat��������ݸ�ֵ
2.	saturate_cast��operations.hpp�ж��������������Ĵ��˲���Ϊfloat���ͣ����õ���

	```
	template<> inline uchar saturate_cast<uchar>(float v)
	{int iv = cvRound(v); return saturate_cast<uchar>(iv);}
	```

	���е������غ���saturate_cast<uchar>(int)��ɣ��ú�����ʵ���ǣ�

	```
	template<> inline uchar saturate_cast<uchar>(int v)
	{return (uchar)((unsigned)v <= UCHAR_MAX ? v : v > 0 ? UCHAR_MAX : 0)}
	```
	����?:��������ҽ�����ԣ�saturate_cast���������þ��ǣ��������ݷ�ΧΪ0~255������255��ֵȡ255��С��0��ֵȡ0

3.	���ز���������û��ʹ��ptrָ�루��Ϊ�������ÿ������صľ���x��y���꣬�ǵ����ص������ص�ӳ�䣩����Ȼʹ��ptrҲ���ԡ�Mat��data��Ա������ͷָ�룬����ͨ��ָ��*p��*q����ͼƬ�е�Ԫ�ؽ��в�����ֵ


## Ч��

![result]

���ΪԪ��ͼ���ұ�Ϊalpha=1��Beta=50ʱ����ǿ���Ⱥ��ͼ��


[result]:../images/OpenCV����ƪ֮���ز����Աȶȵ���/result.png
