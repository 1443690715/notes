[<font size=4>��������Ŀ¼<font>](../README.md)
</br></br></br>

## ���򼰷���

```c
/*
 * FileName : get_pixels.cpp
 * Author   : xiahouzuoxin @163.com
 * Version  : v1.0
 * Date     : Sun 01 Jun 2014 06:40:54 PM CST
 * Brief    : 
 * 
 * Copyright (C) MICL,USTB
 */
#include <cv.h>
#include <highgui.h>

using namespace std;
using namespace cv;

int main(int argc, char *argv[])
{
    if (argc < 2) {
        cout << "Usage: ./get_pixels [imag name]" << endl;
        return -1;
    }

    Mat img;
    
    img = imread(argv[1], 1);
    

    /*
     * Reverse pixels
     */
    Mat out1 = img.clone();  // change dst will not affect img

    long n_rows = out1.rows;
    long n_cols = out1.cols * out1.channels();

    /*
     * Row pointer
     */
    uchar *p;
    for (long i=0; i<n_rows; i++) {
        p = out1.ptr<uchar>(i);
        for (long j=0; j<n_cols; j++) {
            p[j] = 255 - p[j];
        }
    }

    /*
     * Element pointer
     */
    Mat out2;
    out2.create(img.size(), img.type());  // reserve size and type but alloc new space

    n_rows = out2.rows;
    n_cols = out2.cols * out2.channels();

    p = out2.data;
    double c = 0.5;
    double b = 30;
    for (long i=0; i<n_rows*n_cols; i++) {
       *(p+i) = (uchar)(255 * 0.5 * ((double)(img.data[i]) / 255) + b);
    }

    /*
     * Display
     */
    namedWindow("src_image", CV_WINDOW_NORMAL);
    imshow("src_image", img);
    namedWindow("reverse_image", CV_WINDOW_NORMAL);
    imshow("reverse_image", out1);
    namedWindow("mici_image", CV_WINDOW_NORMAL);
    imshow("mici_image", out2);

    waitKey(0);

    return 0;
}
```

1.	����Ԫ��ָ������ط��ʣ�����Mat�����ݽṹ���������ǿ���ͨ��Mat.data�����������ݵ�ָ�룬�ٸ���ָ����ʵ��������ݣ�������ֱ�ӵķ�����һ��ͼƬ�������ڴ��ж��������洢��һ��Ӧ��ʹ��is_continues()�����жϣ�ע�����������û�У���Ϊ�󲿷�����������洢�ģ�����û�п��ǣ������ַ������ط�ʽ��һ���ʽ�ǣ�

	```
	uchar *p;  // ����һ����������ָ��
	p = image.data;  // imageΪMat���󣬽����������ָ�븳ֵ��p
	for (long i=0; i < image.rows*image.cols*image.channels(); i++) {
		*p++ = ..;  // ͨ������ָ���������
	}
	```

	�������ͨ��Ԫ��ָ��ķ���������һ���ݴα任�����ӣ�

	```
	*(p+i) = (uchar)(255 * 0.5 * ((double)(img.data[i]) / 255) + b);
	```

	�ݴα任��һ�ֺܺ��õ�ͼ����ǿ�ķ������ҵ�Github�ϻ���һ��Matlabд�����ݴα任���������ɽ�羰��Ƭ�����ӣ�https://github.com/xiahouzuoxin/zx_photo��

2.	������ָ��ķ��ʣ�OpenCV�ж�����һ��ptr��������һ��ģ�壺

	```
	// returns pointer to the matrix element
	// idx �C rows,you should use @isContinues() before decided it
	template<int n> uchar* ptr(const Vec<int, n>& idx);
	```
	ͨ��ptr<uchar>(i)ֱ�ӻ��Mat����ĵ�i�е�ָ�룬����ά�������ָ����Щ���ƣ��̶�����ͨ��ptr<uchar>(i)[j]�õ���i�е�j�е�����ֵ��

	������������ʹ����ָ�����ͼ��ת�����ӡ�

3.	��ע��һ�������ĺ�����img.clone()֮ǰ�Ѿ������������˿���Mat���ݽṹ��ͷ������ָ�룬������Ҳһ�鿽������������ָ��ָ���¿��������ݡ�


## Ч��

![result]

�����Ԫ��ͼƬ���м��Ǿ���ͼƬ��ת֮���ͼƬ���ұ���ʹ���ݴα任��ǿ���ͼƬ��

[result]:../images/OpenCV����ƪ֮���ط���/result.png