#########################################################################
# FileName : md2html.sh
# Author   : xiahouzuoxin @163.com
# Date     : 2014/10/23 19:51:29
#########################################################################
# 
#!/bin/bash


function index()
{
    echo "## 2014-10" >> index.md
    echo "" >> index.md
    for name in `ls 2014-10*.md`
    do
    if [ ! -d $name ];then
      if [ "${name##*.}" == "md" ]; then
          disp=${name:11}
          echo "- ${name:0-0:10} [${disp%.*}](./$name)" >> index.md
      fi
    fi
    done
}

if [ -f $DIR ]; then
    echo "" > index.md
    # echo "<html><head><title>Index View</title></head><body>">>index.html
    index
    # echo "</body></html>" >> index.html
    exit 0;
fi

if [ -d $DIR ]; then        #�����Ŀ¼
    cd $DIR                 #��Ŀ¼��Ȼ�����Ŀ¼���д������
    exit 0;
fi
