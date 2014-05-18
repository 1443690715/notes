[<font size=4>��������Ŀ¼<font>](../README.md)
</br></br></br>

�Ѳ��Ի�����

1. CentOS 6.3 32bit
2. CentOS 6.5 64bit

������CentOS 6.3 32bit��װ��OpenCV���μ�[CentOS 6.3�а�װOpenCV2.3.1]�������64bitϵͳ����������������һ�顣

## ��鲢��װ��س���ȷ��gtk��װ�ɹ��������޷���ʾͼƬ

```
yum install gcc-c++              # g++����
yum install gtk-devel            # ������gtk����ģ���һ������gtk-devel������ʹ��*gtk-devel*ƥ��
yum install gimp-devel
yum install gimp-devel-tools
yum install gimp-help-browser
yum install zlib-devel
yum install libtiff-devel        # tiff��ʽͼƬ֧��
yum install libjpeg-devel        # jpegͼƬ֧��
yum install libpng-devel         # pngͼƬ֧��
yum install gstreamer-devel      # ����MP3��Ogg��MPEG1��MPEG2��AVI�ȸ�ʽ�Ķ�ý������
yum install libavc1394-devel     # 1394��Ƶ�ӿڵĿ������
yum install libraw1394-devel
yum install libdc1394-devel
yum install jasper-devel
yum install jasper-utils
yum install cmake                # ������빹��OpenCV�Ĺ���
yum install swig
yum install python               # python����֧��
yum install libtool
yum install nasm                 # ��๤��
```

## ��װffmpeg2.1.2

ffmpegû���ֳɵ�����CentOS��rpm���������Ҫʹ��Դ����밲װ��

```
./configure --enable-shared �Cdisable-yasm
make
make install
```

��ʱ��ffmpegĬ�ϰ�װ��/usr/local����.

## ��װOpenCV-2.3.1



1.	ʹ��vi��CMakeLists.txt�ļ����ҵ�����һ�к���ע��(#)

	```
	set_property( CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS${CMAKE_CONFIGURATION_TYPES} )
	# set_property( CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS${CMAKE_CONFIGURATION_TYPES} )
	```

2.	ʹ��vi��CMakeLists.txt�ļ��������ؼ���ffmpeg���ҵ���Ӧλ�ã�

	```
	if(EXISTS /usr/include/ffmpeg/libavformat/avformat.hOR HAVE_FFMPEG_SWSCALE)
	```

	ȷ�������Ŀ¼��/usr/include������ڰ�װffmpegʱ���޸���·����������Ӧ���޸ģ��������ǿ��Բ�����

3.	��opencvԴ������Ŀ¼д�£�����ִ��

	```
	mkdir release
	cd release
	cmake ../
	make
	make install
	```

	�ȴ���װ������Ĭ�ϰ�װ��λ��/usr/local/��

## ����

```
#include <cv.h>
#include <highgui.h>
 
using namespace cv;
int main( int argc, char** argv )
{
  Mat image;
  image = imread(argv[1], 1 );
 
  if( argc != 2 ||!image.data )
    {
      printf("No image data \n" );
      return -1;
    }
  namedWindow("Display Image", CV_WINDOW_AUTOSIZE );
  imshow("Display Image", image );
  waitKey(0);
 
  return 0;
}
```

��дMakefile��

```
SRC=DisplayImage.cpp
LIB=-L/usr/local/lib/
INC=-I/usr/local/include/opencv/
Test:$(SRC)
   g++ -o Test $(LIB)$(INC) -lopencv_core -lopencv_highgui -lopencv_ml $^
```

ִ��make��û�д��󡣼������У�./Test {ImagePathName}�����֡��������ӵ���̬�⡱�Ĵ��󣬴������£�

```
error while loading shared libraries: libopencv_core.so.2.3: cannot open shared object file: No such file or directory
```

����취��

```
cd /etc/ld.so.conf.d/   # ���ļ����´���˸��ֶ�̬���ӿ��·����Ϣ
vim usr-lib.conf
```

���������Ϣ��opencv��lib����·����

```
/usr/local/lib
```

�����ļ���ִ��ldconfig����ɡ�
 
�������У�û���⣬�չ���

![result][]


[CentOS 6.3�а�װOpenCV2.3.1]:http://blog.csdn.net/xiahouzuoxin/article/details/9831263
[result]:../images/CentOS�ϱ��밲װOpenCV-2.3.1��ffmpeg-2.1.2/result.png

