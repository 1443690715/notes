

��Ϊһ���ӱ��Ƶ�����Ϣ����ת�������о�����ͬѧ��һֱ�о�Ƕ��ʽ���źŴ�����ط���һֱ���ҷ�Ϊ�������Ծ���C��Matlab��

�������ǣ��Ҽ������Ը��κ�����ɵ����顣

�ö���Matlab�����棬��ʱ�ͻ�������Matlab���ʵ�ֵĶ�ʱ���Ĺ��ܵ��أ����磺

1. �������˽ṹÿ��10s����һ��
2. �����������5s��ͽ�����

��Matlab���ṩ��һ�����̵߳ķ�������Timer��


ÿ��ʹ��һ���µ�Matlab������������Ͼ��ǰ����ĵ���


```
>> help timer 
>> doc timer 
```

ʹ��Timer�Ĳ������£�

## 1 ����Timer����

timer����Ĵ���ֱ��ͨ��timer������ɵģ�

```
iter     = 400; 
interval = 0.5;  % s
t = timer('TimerFcn', @caputure, ...  % �ص�����caputure����ѡ����
    'Period', interval, ...  % ÿ��interval (s)����һ��caputure����
    'ExecutionMode', 'fixedSpacing', ...
    'TasksToExecute', iter); % ����caputure�����趨Ϊiter
```

Timer����ĸ�ʽΪ��

```
>> t

   Timer Object: timer-1

   Timer Settings
      ExecutionMode: fixedSpacing
             Period: 0.5
           BusyMode: drop
            Running: off

   Callbacks
           TimerFcn: @main/caputure
           ErrorFcn: ''
           StartFcn: ''
            StopFcn: ''
```

- Timer Settings�бȽ���Ҫ�Ĳ����У�

	- ExecutionMode   ִ�е�ģʽ

	����ȷ��TimerFcnִ�����ڼ����ʼĩ��

	'singleShot'    ��ֻ��ִ��һ�Σ���Period���Բ������ã�����ģʽ������ִ�ж��

	'fixedSpacing'  ����һ��TimerFcnִ�����ʱ�̵���һ��TimerFcn���������ʱ��֮��ļ��

	'fixedDelay'    ����һ�ο�ʼִ�е���һ�α��������֮��ļ��      
	 
	'fixedRate'     ��ǰ�����α����뵽ִ��������ʱ��֮��ļ��

	- Period  ʱ����(ִ������)

	Ҳ����ÿ��Periodִ��һ��TimerFcn��ִ�����ڵ���ָ����������ʱ��֮��ļ����ExecutionMode����

	- StartDelay   ����ʱ��

	������Timer��ʼ����һ�ΰ�TimerFcn�ļ��뵽Matlab��ִ����������ȥ��ʱ��, Ĭ��ֵΪ0s           

	- TasksToExecute    ִ�д���

	TimerFcn��ִ�еĴ�����Ĭ��Ϊ1�Σ����ö��ʱ��Ҫ����ִ������Period

- Timer�������һ�����ǻص�������Callbacks��

	- TimerFcn    Timer����
	
	��Timer����ĺ��ģ�Timer�Ķ��߾���ͨ��ִ�����TimerFcn��ʵ�ֵģ�Ҳ��Timer����ı�ѡ����

	- ErrorFcn
	
	- StartFcn   ����Timerʱ���õĺ������������ڳ�ʼ��
	
	- StopFcn	 ֹͣTimerʱ���õĺ���

## 2 �趨�Ͷ�ȡTimer����Ĳ���

���˿����ڴ���Timerʱ�趨��ز����⣬���������ķ���������ʱ���ã�

- ʹ��set/get����

```
%����һ��Ĭ�ϵ�Timer����
TaskTimer=timer
set(TaskTimer,'Name','Matlabsky','TimerFcn',@caputure)
get(TaskTimer,'Name')
````

- ֱ�Ӳ��ݽṹ��

```
TaskTimer=timer
TaskTimer.Name='Matlabsky'
TaskTimer.TimerFcn=@caputure
```
	
## 3 �����ص�����

�ص������ĸ�ʽΪ��

```
function my_callback_fcn(obj,event,p1,p2)
% by dynamic
% see also http://www.matlabsky.com
% 20092.15
%
% ==== obj��eventΪ��ѡ�������
%
% 1. obj����ǰ�洴����Timer������������Timer�����в���
%
% 2. event��һ���ṹ�壬����Type��Data�����ֶ�
%    Type������ǵ�ǰ��Timer����ִ�е�ʱ�䣬����StartFcn��StopFcn��
%    Data��һ���ṹ�壬����timeһ���ֶΣ��������ִ�и��¼���ϵͳʱ��
%
%    ����event��ʹ����event.Type��ȡTimer������ִ���ĸ��¼���event.Data.time��ȡִ�и�ʱ���ϵͳʱ��
%
% ==== p1,p2...���������Զ�������������������Ҫ���Լ����
```




# �ο�

1. http://www.matlabsky.com/thread-646-1-1.html



