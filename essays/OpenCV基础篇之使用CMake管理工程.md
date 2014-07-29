[<font size=4>��������Ŀ¼<font>](../README.md)
</br></br></br>

## ���򼰷���

```c
/*
 * FileName : read.cpp
 * Author   : xiahouzuoxin @163.com
 * Version  : v1.0
 * Date     : Tue 13 May 2014 07:34:25 PM CST
 * Brief    : 
 * 
 * Copyright (C) MICL,USTB
 */
#include <cv.h>
#include <highgui.h>

using namespace cv;
using namespace std;

int main(int argc, char **argv)
{
    Mat img;

    img = imread(argv[1], 1);

    if (argc != 2 || !img.data) {
        cout<<"No image data.\n"<<endl;
        return -1;
    }

    namedWindow("Display Image", CV_WINDOW_AUTOSIZE);
    imshow("Display Image", img);

    waitKey(0);

    return 0;
}
```

1.	�����[OpenCV����ƪ֮��ȡ��ʾͼƬ](OpenCV����ƪ֮��ȡ��ʾͼƬ.md)��ʹ�õĴ���

2.	���û�а�װCMake����ʹ���������װ

	```
	yum install cmake
	```

3.	CMake��һ��̹����������Makefileƽ̨Ǩ���Ը��ã�ͨ��CMake���Զ�����Makefile�����ڱ������CMake�ļ��������£�

	```
	project(read)
	find_package(OpenCV REQUIRED)
	add_executable(read read)
	target_link_libraries(read ${OpenCV_LIBS})
	```

	���������ݱ��浽�ļ���ΪCMakeLists.txt������������ļ��������ļ��У�����ִ��

	```
	cmake ./
	make
	```

	cmake����ֱ������Makefile��ͨ��Makefile���ɿ�ִ���ļ�����Ҳ����Ϊʲôcmakeƽ̨Ǩ���Ժã���ͬ��ƽ̨�����ɶ�Ӧ��Makefile��������Ǩ�Ƶ�Windows����


## Ч��

![result]


[result]:../images/OpenCV����ƪ֮ʹ��CMake������/result.png
