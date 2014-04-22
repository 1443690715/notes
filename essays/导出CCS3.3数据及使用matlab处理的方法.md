[<font size=4>��������Ŀ¼<font>](./README.md)
</br></br></br>

CCS3.3��һ��DSP�ļ��ɿ���������IDE��������DSP����ʱ��Ϊ��֤�㷨��������Ҫʹ��matlab�����㷨��֤����֤�㷨����Ҫ���ݡ���ˣ�һ�ֽ����ķ����ǣ�

1. ʹ��DSP����������CCS
2. ��CCS3.3�˵��еġ�File->Data->Save..�����ܵ���DSP�ڴ��е����ݵ�PC��.dat�ļ���
3. ʹ��Matlab��ȡ.dat�ļ����������ݴ���

�������ʹ��Matlab��ȡCCS������dat�ļ��ķ�����

```
% =========================================================================
% Read *dat file of CCS3.3
% xiahouzuoxin
% 2014.04.21
% =========================================================================

% clc;clear all;close all;

% �Ի���ѡ��*.dat�ļ�
[fname,pname]=uigetfile(...
    {'*.dat';'*.*'},'Input *.dat File');

fid = fopen(fullfile(pname,fname));
fseek(fid, 21,-1);  % ȥ�ļ�ͷ, 21�ֽڣ��� 1651 1 80000006 0 100

% ��ָ����ʽ��ȡ����
fm = 4;
switch (fm)
    case 4  % ��4Byte��ʽ������ 0x 80000000
        x = textscan(fid, '%2s %8s');  
        z(:,1) = hex2dec(x{2});        
    case 2 % ��2Byte��ʽ������ 0x 8000 0000
        x = textscan(fid, '%2s %4s %4s');  
        z(:,1) = hex2dec(x{3});
        z(:,2) = hex2dec(x{2});
    case 1 % ��1Byte��ʽ������ 0x 80 00 00 00
        x = textscan(fid, '%2s %2s %2s %2s %2s');  
        z(:,1) = hex2dec(x{5});
        z(:,2) = hex2dec(x{4});
        z(:,3) = hex2dec(x{3});
        z(:,4) = hex2dec(x{2});
    otherwise
        z = [];
end

if ~isempty(z)
    % �����ݴ�������������
    
end

fclose(fid);
```

������Ĭ��DSP�ڴ������ݵĴ洢��ʽΪ�������ͣ������ڸ�����DSP��TMS320C6713B���������ڴ�����float��double��ʽ�洢�ģ�

![][float-double]

��ʱ�����ǻ���Ҫһ��ת��Ϊ�������Ĳ����������д��һ��ת��Ϊfloat���͵ĺ�����

```
function y = integer2float(x, ishex)
% =========================================================================
% ��Щ����yԭ����float���ͣ����ڴ����ǰ�float��ʽ�洢
% �����ڰ�����������ڴ��ж��������x
% ��������������ڽ���������ʽ������xת���y
% ishex~=0��ʾ����Ϊʮ�����Ƹ�ʽ
% ע��Ҫ��ɸú�����������˽�IEEE�������ĸ�ʽ
%
% xiahouzuoxin
% 2014.04.21
% =========================================================================

if nargin == 2
    if (ishex)
        x = hex2dec(x);
    end
end

[h w] = size(x);
y = zeros(h,w);

for i = 1:h
    for j = 1:w
        sign = bitget(x(i,j),32);
        exponent = bitget(x(i,j),24:31) * 2.^(0:7).';
        fraction = bitget(x(i,j),1:23) * 2.^(-23:-1).';
        y(i,j) = (-1)^sign * (1+fraction) * 2^(exponent-127);
    end
end
```

���ݲ�ͬ���������������Ϊʮ�����Ƶ��ַ�����ʾ��ʮ���������������8Bytes����ʹ�÷����ٸ����ӣ�

```
>> x='4565A012'
>> y=integer2float(x,1);

>> x = 23974881923;
>> y = integer2float(x)
```

�������֣�Matlab�Ѿ����ж�Ӧ�ķ����ˣ�

```
y = typecast(uint32(z),'single');
```

����ֱ�Ӱ�zת��Ϊ����Ϊ�����ȸ�����������ʹ����μ�

```
>> help typecast
```


[float-double]:../images/����CCS3.3���ݼ�ʹ��matlab����ķ���/float-double.png

