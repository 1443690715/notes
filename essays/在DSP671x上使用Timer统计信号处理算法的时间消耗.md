## [<font size=4>��������Ŀ¼<font>](./README.md)
</br></br></br>


## ����ʵ��



```C

hTimer = TIMER_open(TIMER_DEVANY,0); /* open a timer */

/* Configure the timer. 1 count corresponds to 4 CPU cycles in C67 */
/* control period initial value */
TIMER_configArgs(hTimer, 0x000002C0, 0xFFFFFFFF, 0x00000000);

/* Compute the overhead of calling the timer. */
start = TIMER_getCount(hTimer); /* to remove L1P miss overhead */
start = TIMER_getCount(hTimer); /* get count */
stop = TIMER_getCount(hTimer); /* get count */

overhead = stop - start;
start = TIMER_getCount(hTimer); /* get count */

/* Call a function here. */

/* get count */
diff = (TIMER_getCount(hTimer) �C start) ? overhead; 
TIMER_close(hTimer);
printf(��%d cycles \n��, diff*4);

```



ע�⣬C6713�϶�ʱ����һ������ֵ��Ӧ4��ʱ�����ڡ�

overhead��ʾTimer�������ù��̵�ʱ�����ģ�������diff���㣬

```c
diff = (TIMER_getCount(hTimer) �C start) ? overhead; /* get count */
```

