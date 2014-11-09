<!---title:OpenCV����ƪ֮��ȡ��ʾͼƬ-->
<!---keywords:OpenCV-->
<!---date:2014-09-18-->

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

1.	����<cv.h>��<highgui.h>��cv.h�а�����OpenCV�ĺ��Ĺ��ܣ�����Mat�����ݽṹ��highgui.h��Ҫ��������ͼƬ��ʾ�Ľӿڡ�

2.	Mat��OpenCV�����еľ����࣬Mat.data������ָ�룬ͨ���ж�����ָ���Ƿ�ΪNULL����ȷ���Ƿ����ͼƬ���ݡ�

3.	namedWindow�������������亯��ԭ�����£�

	```
	CV_EXPORTS_W void namedWindow(const String& winname, int flags=WINDOW_AUTOSIZE);
	```

	��һ������winname�Ǵ��������Ǵ��ڶ����Ψһ��ʶ���ͺ��˵�����һ������ˣ�����ͬʱ��������ͬ���ֵĴ��ڣ�flags���ô������ԣ�ȱʡ����ֵΪWINDOW_AUTOSIZE=CV_WINDOW_AUTOSIZE=1��

4.	��matlab�е�һ������ľ�У���һ��������ʾ��Ҫ���ĸ�������ʾ���ڶ�������ʾ��Ҫ��ʾ�Ƿ�ͼ���ý�ֺͷ��һ�룬�ǲ�������������������֪��������ʾʲô�ˣ�

5.	����һ��`waitKey(int delay=0)`��ʾͼƬ��ʾ���ڱ���ʱ�䣬��λΪms����delay=0ʱ�����¼��������ⰴ���Ż�ر�ͼ����ʾ�Ĵ���

6.	���ڱ������������Makefile���£�

	```
	TARG=read
	SRC=read.cpp
	LIB=-L/usr/local/lib/
	INC=-I/usr/local/include/opencv/
	CFLAGS=-g

	$(TARG):$(SRC)
		g++ -o $@ ${CFLAGS} $(LIB) $(INC) -lopencv_core -lopencv_highgui $^

	.PHONY:clean

	clean:
		-rm $(TARG) -f 
	```

	�ҽ�OpenCV��װ��Ĭ��Ŀ¼/usr/local�£������ʹ��g++����ʱҪ�������ӿ⣨`-L/usr/local/lib/��`��ͷ�ļ���`-I/usr/local/include/opencv/`��

	ע����OpenCV����ƪ�ж�ʹ�øø�ʽ��Makefile�ļ�����˺�������̶����Կ�����ֱ��ʹ�ã�ֻ��Ҫ�޸�TARG��SRC�������ɣ�


## Ч��

![result]


[result]:../images/OpenCV����ƪ֮��ȡ��ʾͼƬ/result.png
