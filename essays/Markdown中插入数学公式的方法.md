[<font size=4>��������Ŀ¼<font>](../README.md)
</br></br></br>

�Դ�ʹ��Markdown�������Ϳ�ʼһֱʹ��Markdown+Github��д���£������Լ�����ѧ��˼����������ͨ�����ַ�ʽ��ɵġ�

Ȼ����Markdown������д�����Ժܺã�Ψ��������ѧ��ʽʱ��Ҫɷ�ѿ��ġ���ÿ�ζ�����ʹ��Latex��д(���ߵ�Latex�༭���ο�[1])��Ȼ�󱣴�ΪͼƬ��ʹ��img��ǩ�������ã�����ʽ�ܶ��ʱ�����Ը��ӡ�

���ĵķ���ʹ��html���﷨������[1]�Ĺ�ʽ����API����������Latex��ѧ��ʽ����ȥ����ʽ����ΪͼƬ���鷳����Ȼ���׶�Ҳ���еģ���ʽ̫�࣬���ܻ����ˢ�±�һ�����ҳ��һЩ��

## ����һ��ʹ��Google Chart�ķ�����

```
<img src="http://chart.googleapis.com/chart?cht=tx&chl= �ڴ˲���Latex��ʽ" style="border:none;">
```

һ�����ӣ�

```
<img src="http://chart.googleapis.com/chart?cht=tx&chl=\Large x=\frac{-b\pm\sqrt{b^2-4ac}}{2a}" style="border:none;">
```

��ʽ��ʾ���Ϊ��

<img src="http://chart.googleapis.com/chart?cht=tx&chl=\Large x=\frac{-b\pm\sqrt{b^2-4ac}}{2a}" style="border:none;">

�������£�Google Chart����������Ӧ�ٶȻ����ԣ�����˵���ܸ���һЩ��Latex��ʽ�����޷��������ο�[2]����

## ��������ʹ��forkosh������

forkosh���ṩ�˹���Latex��ʽ��һ�ݼ�̶������õİ������ο�[1]��[3].

ʹ��forkosh���빫ʽ�ķ�����

```
<img src="http://www.forkosh.com/mathtex.cgi? �ڴ˴�����Latex��ʽ">
```

�������ӣ�

```
<img src="http://www.forkosh.com/mathtex.cgi? \Large x=\frac{-b\pm\sqrt{b^2-4ac}}{2a}">
```

��ʾ���Ϊ��

<img src="http://www.forkosh.com/mathtex.cgi? \Large x=\frac{-b\pm\sqrt{b^2-4ac}}{2a}">


��Ϊ��ҳ���빫ʽ��ԭ���ǵ��á�ĳĳ��վ�ķ���������̬���ɵģ����б�֤��ʽ������ʾ��ǰ���Ǹ���ַ��һֱ������Ϊ�ҵ�С����ЩСС�ķ���forkosh�������˿�2���ˣ�һֱ�ܺã��Ƽ���

## ��������ʹ��MathJax����

��Ҷ�����[Stackoverflow](http://stackoverflow.com/)�ϵĹ�ʽ�ɣ�Ư���������ɵĲ���ͼƬ�����Ҫ�õ�MathJax���棬��Markdown�����MathJax����Ҳ�ܼ򵥣�

```
<script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=default"></script>
```

<script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=default"></script>

Ȼ����ʹ��Texд��ʽ��`$$��ʽ$$`��ʾ�м乫ʽ������Tex��ʹ��`\(��ʽ\)`��ʾ���ڹ�ʽ������ΪMarkdown��`\`��ת���ַ���������Markdown���������ڹ�ʽʹ��`\\(��ʽ\\)`�����´��룺

```
$$x=\frac{-b\pm\sqrt{b^2-4ac}}{2a}$$
\\(x=\frac{-b\pm\sqrt{b^2-4ac}}{2a}\\)
```

�ֱ���ʾ������м乫ʽ����

$$x=\frac{-b\pm\sqrt{b^2-4ac}}{2a}$$

���ڹ�ʽ��

\\(x=\frac{-b\pm\sqrt{b^2-4ac}}{2a}\\)

���ţ��������һ�£��ڹ�ʽ�ϻ�����ʹ������Ҽ�������

## ����Ƭ��

��û���ù�Sublime Text�༭������˵�����Ƭ�ι��ܷǳ�ǿ��Ȼ��������Ը�Ƽ�һ������༭��Everedit��С��ʵ�á���Ҳ֧��Markdown��Ҳ�д���Ƭ�ι��ܣ���ʹ�õ�������Ѱ汾2.���ɡ�

�˵���`����->����Ƭ��`������Ƭ�����Ҽ�`����`����д�������£�

1.	ʹ��forkosh������������ʽ

```
@����:Equation
@�����ı�:Equation
@����Ƭ��:������һ�п�ʼ��������!

<img src="http://www.forkosh.com/mathtex.cgi? \Large x=\frac{-b\pm\sqrt{b^2-4ac}}{2a}">

```

2.	ʹ��MathJax������ʽ

```
@����:MathJax
@�����ı�:MathJax
@����Ƭ��:������һ�п�ʼ��������!
<script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=default"></script>
```

���֮��������Equation��MathJax�Ĵ���Ƭ�Σ�ÿ����ӹ�ʽʱֻ��Ҫ˫���ô���Ƭ�����Զ���������ģ�壬����ʡ�£�

## �ο�

[1] <http://www.forkosh.com/mathtextutorial.html>

[2] <http://www.ruanyifeng.com/blog/2011/07/formula_online_generator.html>

[3] <http://www.forkosh.com/mathtex.html>
