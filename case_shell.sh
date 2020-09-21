#!/bin/bash
#/**********************************************************
# * Author        : Jay-L
# * Email         : 1046250579@126.com
# * Last modified : 2020-07-27 08:34
# * Filename      : case_shell.sh
# * Description   : 
# * *******************************************************/

case ${1} in
  "hello")
	echo "Hello, how are you ?"
	;;
  "")
	echo "You MUST input parameters, ex> {${0} someword}"
	;;
  *)    #其实就相当于万用字元，0~无穷多个任意字元之意！
	echo "Usage ${0} {hello}"
	;;
esac
#执行这个脚本时，要直接输入参数    bash case_shell.sh  hello
