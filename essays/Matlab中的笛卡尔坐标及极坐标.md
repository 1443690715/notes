[<font size=4>��������Ŀ¼<font>](../README.md)
</br></br></br>

## ����plot�ĵѿ�������

- ���Ƶѿ�������

```
x = -pi:pi/10:pi;
y = tan(sin(x)) - sin(tan(x));
plot(x,y,'--rs','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','g',...
                'MarkerSize',10)
```

- ͼƬ����͸��

```
set(gcf,'color','none');  %ͼ�α�����Ϊ��ɫ
set(gca,'color','none');  %�����ᱳ����Ϊ��ɫ����������Ҫ��ͨ��ͼ�α����İ�ɫʵ��Ϊ�����ᱳ��ɫ
```

plot��Ĭ�ϵı����ǰ�ɫ�ģ�����д����ʱҪʹͼƬ����͸����������á�

- �޸�������

```
xlabel('\fontname{Arial}time/s', 'fontsize', 11);   % ���ú�����Ϊtime��11��Arial����
ylabel('\fontname{Arial}cost(uJ)', 'fontsize', 11); % ����������Ϊcost��11��Arial����
xlim([xmin xmax]);  % ����x�᷶ΧΪ[xmin xmax]
ylim([ymin ymax]);  % ����y�᷶ΧΪ[ymin ymax]
axis([xmin xmax ymin ymax]);  % ͬʱ����xy�����귶Χ
axis on;    % ��ʾ������
axis off;   % ����ʾ������
```

- �����ͼע

```
title('string');   % ����Ϊstring
legend('string1','string2',...);  % ͼ����ע
```


## ����polar�ļ�����

- ���Ƽ�����

```
t = 0:0.01:2*pi;
polar(t, sin(2*t) .* cos(2*t), '--r');
```

����tΪ���ǣ�sin(2*t).*cos(2*t)Ϊ������

- �޸Ļ��ǵļ��

��polar.m�ļ����޸�����һ�У�Ĭ�ϼ��Ϊpi/6��

```
th = (1 : 6) * 2 * pi / 12;
```

