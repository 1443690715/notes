[<font size=4>��������Ŀ¼<font>](../README.md)
</br></br></br>

���ڵ���Ҫдд���ĵ�ʱ���ˣ�����һ��ǰ���Ʊ�ҵ�����ģ���ʱ�򡪡����ľ�������һ���ͼ��ָ��ʶ�𣬱�ҵ��ʱ���Ѽ�һ����һ�꿴�������ģ���ӡ��ֽ�ʰ���һ���Ȼ�кü�����񣬶��һ�����Ӣ�ĵġ���һֱ���Ҹе��Ժ�����÷ǳ���л�Ǹ�ʱ��Ϊ�ҵ���������ʦ�����ҵĴ�ѧ������2��Ƕ��ʽ�����Ե���һ����ζ������ֵ�׼�����ĵ�ʱ���ˣ�����������ڿ�Դ�����ӵ����Ҳ����ú�����Latex��������ˡ�

����������CentOS 6.5 64bit

## ��װ

�����ú�CentOS��yumԴ���ο�[CentOS����yumԴ�ķ���](./CentOS����yumԴ�ķ���.md)�����úú�ִ��

```
yum install texlive*
```

��װtexlive��صİ������������ȴ����ذ�װ��ɣ�������Latex���������ú��ˡ�texliveĬ�ϰ�װ��`/usr/share/texmf/`Ŀ¼��.

���ʱ�򲻷�ʹ����дһС�����֣��ļ�����Ϊ`Hello.tex`

```
\documentclass{article}

\author{xiahouzuoxin}
\title{Signal Processing}

\begin{document}
    \maketitle
    First ducument I write use Latex.  % coments
\end{document}
```

Latex����һ�ű�����ԣ�д�����Ҫ���룬���������ĵ�������Ϊ��`xelatex hello.tex`. ������ļ��л���һ��hello.pdf���ļ����򿪺�Ч����

![hello]

## ��������֧��

ʹ��xelatex������벻��֮ǰ��latex�������һ�����Լ��������壬xelatex�������ʹ��ϵͳ���壬�������尲װ���������ҪΪϵͳ��װ�������壬CentOS��װ��������ķ����μ�[CentOS��װ��������](./CentOS��װ��������.md)��

�Ҵ�Windows�п�����װ��`����`��`����`��`��������`��`���Ŀ���`��`��Բ`��`����`���������塣

Ϊ���㰲װ������������Latex�е�ʹ�ã�����ʹ�����������������������ĺ���C�����еĺ궨�������Ƶĸ��Latex�к�����ļ���׺��Ϊ.sty����

```
% Filename: zhfontcfg.sty
% xetex/xelatex �����趨���

\ProvidesPackage{zhfontcfg}
\usepackage[cm-default]{fontspec} %[cm-default]ѡ����Ҫ�������ʹ����ѧ����ʱ��ѧ���Ų���������ʾ������

\usepackage{xunicode,xltxtra}
\defaultfontfeatures{Mapping=tex-text} %���û����������һЩ tex �����ַ��޷�����ʹ�ã��������ַ���

% ���Ķ���
\XeTeXlinebreaklocale "zh"
\XeTeXlinebreakskip = 0pt plus 1pt minus 0.1pt

%��ϵͳ������ӳ��Ϊ�߼��������ƣ���Ҫ��Ϊ��ά���ķ���
\newcommand\fontnamehei{SimHei}              % ����
\newcommand\fontnamesong{SimSun}             % ����
\newcommand\fontnamezhsong{STZhongSong}      % ��������
\newcommand\fontnamekai{STKaiti}             % ���Ŀ���
\newcommand\fontnameyouyuan{YouYuan}         % ��Բ
\newcommand\fontnameLi{LiSu}                 % ����
\newcommand\fontnamemono{DejaVu Sans Mono}  
\newcommand\fontnameroman{Times New Roman}

%%���ó��������ֺţ��������
\newcommand{\erhao}{\fontsize{22pt}{\baselineskip}\selectfont}
\newcommand{\xiaoerhao}{\fontsize{18pt}{\baselineskip}\selectfont}
\newcommand{\sanhao}{\fontsize{16pt}{\baselineskip}\selectfont}
\newcommand{\xiaosanhao}{\fontsize{15pt}{\baselineskip}\selectfont}
\newcommand{\sihao}{\fontsize{14pt}{\baselineskip}\selectfont}
\newcommand{\xiaosihao}{\fontsize{12pt}{\baselineskip}\selectfont}
\newcommand{\wuhao}{\fontsize{10.5pt}{\baselineskip}\selectfont}
\newcommand{\xiaowuhao}{\fontsize{9pt}{\baselineskip}\selectfont}
\newcommand{\liuhao}{\fontsize{7.5pt}{\baselineskip}\selectfont}

%�����ĵ���������Ϊ����
\setmainfont[BoldFont=\fontnamehei]{\fontnamesong}
\setsansfont[BoldFont=\fontnamehei]{\fontnamekai}
\setmonofont{\fontnamemono}

%����
\newfontinstance\KAI {\fontnamekai}
\newcommand{\kai}[1]{{\KAI#1}}

%����
\newfontinstance\HEI{\fontnamehei}
\newcommand{\hei}[1]{{\HEI#1}}

%Ӣ��
\newfontinstance\ENF{\fontnameroman}
\newcommand{\en}[1]{\,{\ENF#1}\,}
```

��.tex��Latex�ļ���ʹ��usepackage{zhfontcfg}����ʹ������ĺ���ļ���������һ��ʹ��zhfontcfg�����д��Ӣ�Ļ�ϵ�ʵ����

```
% FileName: main.tex

\documentclass{article}

\usepackage{zhfontcfg}
\usepackage[colorlinks,linkcolor=black]{hyperref}

\title{latex���������ʾ��}
\author{�ĺ�����}

\begin{document}
\maketitle
  \section{����}
  \kai{����}
  \section{����}
  \hei{����}

  ���Ǳ����Ƽ���ѧ��ѧ��.    % ������Ĭ�ϵ���������
  
  \section{Ӣ��}
  \en{English Times New Roman}
\end{document}
```

ʹ��`xelatex main.tex`�����Ľ��Ϊ��

![zhfontcfg]

�����ò�������Ѿ��ܹ�ʹ��Latex��ʼ��д�ˣ�

ע�⣺Ҫʹ��xelatex������ļ���ʽ������UTF-8��VIM��ʹ������`��set filetype=utf-8`���ɣ�Windows��ʹ��CTex�����Ϊѡ��UTF-8��ʽ����Ȼ��Windows��ʹ�����������и�����ķ�����

```
\usepackage{xeCJK}
\usepackage{fontspec}
\setCJKmainfont{SimSun}
\setCJKmonofont{SimSun}
\setmainfont{Times New Roman}
```

���е�\\setCJKmainfont{SimSun}����������������Ϊ���������塣�����������������Ӣ��ϵ������кÿ���



## Latex�﷨


## Latexģ��




## �ο�����

1.	[һ�ݲ�̫��̵�LATEX2�Ž������İ�](http://hhtao.weebly.com/uploads/3/3/7/2/3372398/lshort-zh-cn.pdf). �汾 4.20��������������.
2.	[The Not So Short Introduction to LATEX 2��](http://mirror.neu.edu.cn/CTAN/info/lshort/english/lshort.pdf). Version 5.03, April 25, 2014.
3.	LaTeX���˽̡̳���30���Ӵ���ȫİ������������.


[hello]:../images/Latex����/hello.png
[zhfontcfg]:../images/Latex����/zhfontcfg.png

