[<font size=4>��������Ŀ¼<font>](../README.md)
</br></br></br>

## ���򼰷���

```c
/*
 * FileName : lookup_table.cpp
 * Author   : xiahouzuoxin @163.com
 * Version  : v1.0
 * Date     : Sun 01 Jun 2014 04:35:37 PM CST
 * Brief    : 
 * 
 * Copyright (C) MICL,USTB
 */
 
#include <cv.h>
#include <highgui.h>

using namespace std;
using namespace cv;

#define QUAN_VAL1          (10)
#define QUAN_VAL2          (100)

void CreateLookupTable(Mat& table, uchar quan_val)
{
    table.create(1,256,CV_8UC1);
	
    uchar *p = table.data;
	for(int i = 0; i < 256; ++i)
	{
		p[i] = quan_val*(i/quan_val);
	}
}

int main(int argc, char *argv[])
{
    Mat img;
    Mat out1;
    Mat out2;

    if (argc < 2) {
        cout << "Please input image file name." << endl;
        return -1;
    }

    img = imread(argv[1], 1);


    Mat table;
    CreateLookupTable(table, QUAN_VAL1);
    LUT(img, table, out1);
    CreateLookupTable(table, QUAN_VAL2);
    LUT(img, table, out2);  // Call OpenCV function

    namedWindow("Lena", CV_WINDOW_NORMAL);
    imshow("Lena", img);
    namedWindow("QUAN_VAL=10", CV_WINDOW_NORMAL);
    imshow("QUAN_VAL=10", out1);
    namedWindow("QUAN_VAL=100", CV_WINDOW_NORMAL);
    imshow("QUAN_VAL=100", out2);

    waitKey(0);

    return 0;
}
```

1.	ΪʲôҪʹ�ò��ұ�

	һ��ĻҶ�ͼ����256���Ҷȼ�������ʱ���ǲ�����Ҫ��ô��ȷ�ĻҶȼ�������Ӱ������ʱ�䣩������ڰ�ͼ������ζ��������һ���µ�����ֵ���ֵ�ǰ����ɫ�ռ䣬����Ҷȵ��ڰ�ɫ����0~127�Ҷ�ֱֵ�Ӹ�ֵ0��128~255��ֵ1�����յõ����ٵĺڰ���ɫ�����ұ�Ͱ��������ֽ��ͻҶȼ�����������ٶȵĽ�ɫ������ǰ��������ĻҶ�ֵ����������ı��ʽ��ʾ��
	
	<img src="http://www.forkosh.com/mathtex.cgi? \small I_{\text{new}}=\frac{I_{\text{old}}}{Q}*Q">

	����Q��ʾ����������ȡ10����ʾ���Ҷ�ֵ1-10�ûҶ�ֵ1��ʾ���Ҷ�ֵ11-20�ûҶ�ֵ11��ʾ���Դ����ƣ�
	
2.	ʹ�����湫ʽ�Ͳ��ұ���ë��ϵ����Ȼû�У������湫ʽ���۾���Ҫ��ͼƬ������ÿ���Ҷ�ֵ������һ�Ρ���ˣ����ų�������еġ��Կռ任ʱ�䡱�Ļ����㷨���ԣ�������ұ����ұ���ǽ�0~255���Ҷ�ֵ������Ľ����ǰ����ô洢��һ�����У���������е�CreateLookupTable������ɸù��ܵĺ������ӳ����п��Կ��������ұ�����ݽṹ����ΪMat���͡�

3.	���˲��ұ��Ҫ��ͼ���е����ػҶ�ֵ�����滻��OpenVC�ṩ��ʹ�ò��ұ�ֱ�Ӽ���������Ҷȼ���ͼ��ĺ�������LUT���亯��ԭ��Ϊ��

	```
	//! transforms array of numbers using a lookup table: dst(i)=lut(src(i))
	CV_EXPORTS_W void LUT(InputArray src, InputArray lut, OutputArray dst,
	                      int interpolation=0);
	```

	ע��Ŷ�����ǳ����ж���Ĳ��ұ�����ΪMat������LUT�������������������ô��InputArray��OutputArray����OpenCV�У�InputArray/OutputArray����ӿ��������Mat��Mat_<T>��Mat_<T, m, n>��vector<T>��vector<vector<T>>��vector<Mat>��
	
	Ҳ����ζ�ŵ��㿴refman����Դ����ʱ��������������Ĳ���������InputArray/OutputArray��ʱ�������߼���������Ϊ�������ǿ��Եġ�

	���⣬��ע�⣬InputArray/OutputArrayֻ����Ϊ�������ββ���ʹ�ã���Ҫ��ͼ����һ��InputArray���͵ı�����OutputArrayҲֻ��InputArray�����������У����о���OutputArrayOfArrays��InputOutputArray��InputOutputArrayOfArrays����OutputArray�ı��������������!


## Ч��

![result]

���Ϻã�ǧ�����ƣ�һ����ͥ��

�����ԭʼͼƬ���м�������ֵQ=10ʱ�Ľ������Ϣ��ʧ���٣��ұ�������ֵQ=100��ͼƬ���ܶ���Ϣ��ʧ�ˣ���Ҳ����һ����ζ��

[result]:../images/OpenCV����ƪ֮���ұ�/result.png