[<font size=4>��������Ŀ¼<font>](../README.md)
</br></br></br>

## ���򼰷���

```c
/*
 * FileName : MatObj.cpp
 * Author   : xiahouzuoxin @163.com
 * Version  : v1.0
 * Date     : Thu 15 May 2014 09:12:45 PM CST
 * Brief    : 
 * 
 * Copyright (C) MICL,USTB
 */
#include <cv.h>
#include <highgui.h>
#include <iostream>

using namespace std;
using namespace cv;

int main(void)
{
    /*
     * Create Mat
     */
    Mat M(2,2,CV_8UC3, Scalar(0,0,255));
    cout << "M=" << endl << " " << M << endl << endl;

    /*
     * Matlab style
     */
    Mat E = Mat::eye(4,4,CV_64F);
    cout << "E=" << endl << " " << E << endl << endl;
    E = Mat::ones(4,4,CV_64F);
    cout << "E=" << endl << " " << E << endl << endl;
    E = Mat::zeros(4,4,CV_64F);
    cout << "E=" << endl << " " << E << endl << endl;


    /*
     * Convert IplImage to Mat
     */
    IplImage *img = cvLoadImage("../test_imgs/Lena.jpg");
    Mat L(img);
    namedWindow("Lena.jpg", CV_WINDOW_AUTOSIZE); 
    imshow("Lena.jpg", L);
    waitKey(0);

    /*
     * Init Mat with separated data
     */
    Mat C = (Mat_<int>(3,3) << 0,1,2,3,4,5,6,7,8);
    cout << "C=" << endl << " " << C << endl << endl;


    return 0;
}
```

1.	Mat��OpenCV����������ݽṹ��Mat������Matrix������д��Mat���ݽṹ��Ҫ����2���֣�Header��Pointer��Header����Ҫ��������Ĵ�С���洢��ʽ���洢��ַ����Ϣ��Pointer�д洢ָ������ֵ��ָ�롣�����ڶ�ȡͼƬ��ʱ����ǽ�ͼƬ����ΪMat���ͣ������صĹ��캯��һ��ѣ�

	```
	class CV_EXPORTS Mat
	{
	public:
	    //! default constructor
	    Mat();
	    //! constructs 2D matrix of the specified size and type
	    // (_type is CV_8UC1, CV_64FC3, CV_32SC(12) etc.)
	    Mat(int _rows, int _cols, int _type);
	    Mat(Size _size, int _type);
	    //! constucts 2D matrix and fills it with the specified value _s.
	    Mat(int _rows, int _cols, int _type, const Scalar& _s);
	    Mat(Size _size, int _type, const Scalar& _s);
	    
	    //! constructs n-dimensional matrix
	    Mat(int _ndims, const int* _sizes, int _type);
	    Mat(int _ndims, const int* _sizes, int _type, const Scalar& _s);
	    
	    //! copy constructor
	    Mat(const Mat& m);
	    //! constructor for matrix headers pointing to user-allocated data
	    Mat(int _rows, int _cols, int _type, void* _data, size_t _step=AUTO_STEP);
	    Mat(Size _size, int _type, void* _data, size_t _step=AUTO_STEP);
	    Mat(int _ndims, const int* _sizes, int _type, void* _data, const size_t* _steps=0);
	    
	    //! creates a matrix header for a part of the bigger matrix
	    Mat(const Mat& m, const Range& rowRange, const Range& colRange=Range::all());
	    Mat(const Mat& m, const Rect& roi);
	    Mat(const Mat& m, const Range* ranges);
	    //! converts old-style CvMat to the new matrix; the data is not copied by default
	    Mat(const CvMat* m, bool copyData=false);
	    //! converts old-style CvMatND to the new matrix; the data is not copied by default
	    Mat(const CvMatND* m, bool copyData=false);
	    //! converts old-style IplImage to the new matrix; the data is not copied by default
	    Mat(const IplImage* img, bool copyData=false);
	    
	    ......
	    }
	```

	Ҫ�˽���γ�ʼ��Mat�ṹ����Ӧ���˽����Ĺ��캯������������еĵ�һ��ʼ����ʽ���ö����

	```
	Mat(int _rows, int _cols, int _type, const Scalar& _s);
	```
	
	������캯����

	IplImage*��C���Բ���OpenCV�����ݽṹ���ڵ�ʱC����OpenCV��ʱ�򣬵�λ��ͬ��Mat��OpenCVΪ���ṩ��һ���ӿڣ��ܷ����ֱ�ӽ�IplImageת��ΪMat����ʹ�ù��캯��

	```
	Mat(const IplImage* img, bool copyData=false);
	```

	��������еĵڶ��ַ�������ʹ�õ�������캯����

2.	����Mat���ݸ��ƣ�ǰ��˵��Mat����ͷ������ָ�룬��ʹ��Mat�Ĺ��캯����ʼ����ʱ�򣬻Ὣͷ������ָ�븴�ƣ�ע�⣺ֻ��ָ�븴�ƣ�ָ��ָ��ĵ�ַ���Ḵ�ƣ�����Ҫ������Ҳ���ƣ������ʹ��copyTo��clone����

	![mat]

3.	Mat���м������õĳ�Ա��������֮��������н���ʹ�õ���

	```
	//! returns true iff the matrix data is continuous
	// (i.e. when there are no gaps between successive rows).
	// similar to CV_IS_MAT_CONT(cvmat->type)
	bool isContinuous() const;
	```
	���˽�����ĺ�������ǰ�����˽���OpenCV�д洢���صķ��������£��Ҷ�ͼ����ͨ�����洢�����д洢��

	![single_channel]

	��ͨ��RGB�洢��ʽ���£�ÿ�к�������ͨ����
	
	![rgb_channel]

	Ϊ�˼ӿ���ʵ��ٶȣ�openCV���������ڴ��н��������������ش洢��һ�У�isContinus()���������þ��������ж��Ƿ������洢��һ�С��洢��һ����ʲô�ô��أ��������е�ͷָ��p����ֻҪʹ��p++������������������ݡ�

	��˵��жϴ����һ�е�ʱ�򣬿���ͨ������ָ��++�����ױ���ͼ�����أ�

	```
	long nRows = M.rows * M.channels();  // channels()Ҳ��Mat��һ�����õĺ��������ڻ�ȡͨ������RGB=3���Ҷ�=1��
	long nCols = M.cols;
	uchar *p = M.data;  // ����ָ��
	if(M.isContinuous())
	{
		nCols *= nRows;
		for (long i=0; i < nCols; i++) {
			*p++ = ...; // ���ظ�ֵ���ȡ����
		}		
	}
	```

	��ע�����ϼ������õ�Mat��Ա�����ͺ�����

	```
	M.row; // ����ͼ������
	M.nCols;  // ����ͼ������
	M.channels();  //����ͨ����
	M.isContinuous(); // ����bool���ͱ�ʾ�Ƿ������洢
	```
	
4.	�������Mat����Ϣ��ο���װĿ¼�µ�include/opencv2/core.hpp�ļ�


## Ч��

![result]

����Ǿ����һЩ�������������ұߵ�ͼ��ͨ��IplImage *�ṹ���룬ת��ΪMat����ʾ�����


[mat]:../images/OpenCV����ƪ֮Mat���ݽṹ/Mat.png
[single_channel]:../images/OpenCV����ƪ֮Mat���ݽṹ/single_channel.png
[rgb_channel]:../images/OpenCV����ƪ֮Mat���ݽṹ/rgb_channel.png
[result]:../images/OpenCV����ƪ֮Mat���ݽṹ/result.png
