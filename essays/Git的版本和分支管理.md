[<font size=4>��������Ŀ¼<font>](./README.md)
</br></br></br>

�����Ѿ���gitʹ�ñȽ���Ϥ�ˣ���ƪ����git��֧�Ͱ汾�ĵĹ���������ϸ��¼ÿһ��ϸ�ڡ�����㻹����Ϥgit�����Ȳο���

[1] http://blog.csdn.net/xiahouzuoxin/article/details/9393119

[2] http://blog.csdn.net/xiahouzuoxin/article/details/9398629

[3] http://blog.csdn.net/xiahouzuoxin/article/details/18076043

## ���صķ�֧����

������֧�������ʹ��

```
git branch dev
```

��ʹ�����һ��dev��development֮�⣩�����õģ�ѡ��ʹ������ķ�������������֧����dev����������Զ��л����´����ķ�֧��

```
git checkout -b dev
```

Ҫ�л�master��֧��ô�죿ʹ��

```
git checkout master
```

��Ȼ��Ҳ����ʹ��

````
git checkout dev 
```

�ٴ��л���dev��֧��

���ˣ�������������֧��master��dev�ˡ�����������ȥ��ͻȻ��ͣ���µĻ�Ҫ��ߣһ�ѣ�ߣ��ع�ͷ��֪���������ĸ���֧�ˣ���ô�죿

```
git branch
```

![git-branch]

�㶨��git branch���Բ鿴��ǰ���еķ�֧��Ϣ�����ڽ���ǰ���ڷ�֧��������ǰ��֧ǰ���и�*�š�


ĳ��Ҫ����ĳ�����㷨���ֲ��ܱ�֤�ܵ��ã����´�����ԭ�еĳ�����ô�죿��һ���·�֧��

```
git checkout -b debug
```

��debug��֧�������棬master��֧��dev��֧������Ӱ�졣��ʱ�������������

- ����������û��������������ǿ��֢��debug��֧һֱ���������ǲ�ˬ��ɾ��


```
git branch -d debug
```


- ��ϲ���㷨���Գɹ�����Ҫ�ϲ���master��


```
git checkout master   // �л���master
git merge debug       // �ϲ�debug��master 
```

��ʱ���������ˣ�ֱ�Ӻϲ��ɹ������˵���������ʱ�з��������ϲ�������ͻ���ǳ��е��£����һ�����������������ʾ

```
CONFLICT (content): Merge conflict in ...
Automatic merge failed; fix conflicts and then commit the result.
```

�͵��Լ����ֽ����ͻ�ˣ�git���� 


```
<<<<<<<HEAD
 masterԭ�е�����
=======
 debug��֧�г�ͻ������
>>>>>>>debug
```

�����ĸ�ʽ�����㣬ֻҪ�޸ı���ʵ����Ҫ�����ݺ󼴿ɽ����ͻ�������ͻ��Ϳ���ִ��git commit��

���ˣ����Ǻϲ���master��debug����IT�����ܻ�͵���ȣ��뿴��git����ô��¼�ϲ��ģ�û���⣬

```
git log --graph --pretty=oneline --abbrev-commit
```

�Ϳ���ֱ�ӿ�����֧�ϲ��Ĺ��̡������и����Ĺ��̺ϲ�Ч�������ӣ�

![example]


��󣬷���debug�������ˣ�ɾ��debug��֧

```
git branch -d debug
```

## Զ�̵ķ�֧����

�������еĿ�����������dev�Ͻ��У�һ�����˴��ͻ�ƣ���ϲ���master��

- ��Ȼ����dev��֧����ҲҪ�������͵�github��

�������dev���л���dev��

```
git branch
git checkout dev 
```

���ǵ�����֮ǰ����master��֧��Զ��origin��

```
git push -u origin master
```

����devҲ��һ���ģ�ֻҪָ����֧��Ϊdev�Ϳ����ˣ�

```
git push -u origin dev 
```

- ͬѧA��ͷд�˸���Ŀ���ϰ�����Ҳ��������ͬѧA˵���㵽github��ͼclone�ҵĴ����

```
git clone git@github.com:....
```

���ǣ�����git branch��������ֻ��clone��master��֧��dev�أ�����ǷѾ����ģ�Ҫ��ͬѧA��dev��֧�Ͽ������ͱ��봴��Զ�̵�dev��֧������

```
git checkout -b dev origin/dev 
```

����git branch���������˰ɡ�

- ��ͬѧA�Ļ��������������¹��ܣ��ϰ���ţ��Ͻ��ύ

```
git checkout dev 
git pull origin dev 
```

- �ϰ�ĳ��ͻȻ����˵���㿴ͬѧA�����޸��˺ö�Bug������������ѧѧ

```
git pull origin dev  
```

���ܳ��ֳ�ͻ���������ܽ�����һ�ε��ύ��

���ٵĳ��ϣ�Ҫ�������ϰ�������¾����ˣ�Ҫ�����ǡ�����������˵�ˣ���Ҫɾ��Զ��dev��֧��Ҳ���а취�ģ�

```
git push oringin :dev 
```

## ����Tag����

�ۣ���һ����̱�ʽ��ͻ�ƣ���ľ�У���ʱ���СС������һ�£������ǩ��Tag������ʾ���Ǹ��ɿ��Ŀɷ����汾��

```
git tag -a v1.0 -m "��һ����̱���ͻ��"
```

��Ȼ��ע�ͱ�������һ����"��һ����̱���ͻ��"��д����ôû��Ӫ������������ֺ���Ҫ��Ĭ�ϵı�ǩ���������µ�commit�ϡ�

�鿴������Щ��ǩʹ��

```
git tag 
```

�鿴ĳ����ǩ����Ϣ��

```
git show v1.0
```

���ˣ�����Ҳ��ʧǰ���ʱ�򣬱�ǩ���Ҳ�������ģ�

```
git tag -d v1.0
```

����ɾ��v1.0��ǩ��


## Զ��Tag����

����Ҫ��v1.0���͵�Զ�̣�

```
git push origin v1.0
```

�����еı�ǩһ�����͵�Զ�̸�ˬ��

```
git push origin --tags
```

ɾ��Զ�̵ı�ǩ������Ե�github��ɾ����Ҳ���ԣ�

- ��ɾ�����ص�

```
git tag -d v1.0
```

- ɾ��Զ�̵�

```
git push origin :refs/tags/v1.0
```

## ��β���ο�

���ˣ���һ�����ˣ����ž���ʹ��git�����ڰɣ�

[1] [��ѩ��Git�̳�](http://www.liaoxuefeng.com)


[git-branch]:../images/Git�汾�ͷ�֧����/git-branch.png
[example]:../images/Git�汾�ͷ�֧����/example.png