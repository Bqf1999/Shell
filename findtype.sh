#!/bin/bash
#author:fan
#2022-3-29

#传入一个或两个参数
#路径 后缀类型
#后缀类型


if [ $# == 1 ]                      #传入一个参数 后缀类型
then 
  dir=$(pwd)                        #当前工作路径
  type=$1
  echo "传入一个参数，在当前路径下查询：${dir} ${type}"
else                                #传入两个参数 路径 后缀类型
  dir=$0
  type=$1
  echo "传入两个参数：${dir} ${type}"
fi

#递归查询函数
function findType(){
  for file in `ls $1`               #遍历目录 
    do
      if [ -d ${file} ]             #如果是目录，递归
      then findType $1"/"${file} $2
      else 
        if [ ${file##*.} == $2 ]        #判断类型，是，打印文件名
        then echo $1"/"${file}
        fi
      fi
    done
}

findType  $dir $type                #调用函数

