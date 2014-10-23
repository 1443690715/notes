#########################################################################
# FileName : md2html.sh
# Author   : xiahouzuoxin @163.com
# Date     : 2014/10/23 19:51:29
#########################################################################
# 
#!/bin/bash

function md2html()
{
    for name in `ls $1`
    do
    if [ ! -d $name ];then
      if [ "${name##*.}" == "md" ]; then
        pandoc $name -o "../html/"${name%.*}".html" -c ../stylesheets/Github.css
        echo "$name"
      fi
    fi
    done
}

if [ -f $DIR ]; then
    md2html
    exit 0;
fi

if [ -d $DIR ]; then        #�����Ŀ¼
    cd $DIR                 #��Ŀ¼��Ȼ�����Ŀ¼���д������
    exit 0;
fi
