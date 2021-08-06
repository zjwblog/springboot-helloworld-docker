#!/bin/bash



APP_NAME=springboot-helloworld-docker
APP_VERSION=v1.0
JAR_NAME=${APP_NAME}-${APP_VERSION}.jar

# 自定义配置
if [ -z "${PROJECT_HOME}" ]; then
  export PROJECT_HOME="$(cd "`dirname "$0"`"/.; pwd)"
fi

JAVA_OPTS="-Xms4g -Xmx4g -Dfile.encoding=UTF-8 "

function test() {
#linux中shell变量$#,$@,$0,$1,$2的含义解释:
#变量说明:
echo '$$' $$ #Shell本身的PID（ProcessID）
echo '$!' $! #Shell最后运行的后台Process的PID
echo '$?' $? #最后运行的命令的结束代码（返回值）
echo '$-' $- #使用Set命令设定的Flag一览
echo '$*' $* #所有参数列表。如"$*"用「"」括起来的情况、以"$1 $2 … $n"的形式输出所有参数。
echo '$@' "$@"
echo '${@:2}' "${@:2}" #所有参数列表。如"$@"用「"」括起来的情况、以"$1" "$2" … "$n" 的形式输出所有参数。
echo '$#' $# #添加到Shell的参数个数
echo '$0' $0 #Shell本身的文件名
echo '$1 $2 $3 $4 $5 $6 $7' $1 $2 $3 $4 $5 $6 $7 #添加到Shell的各参数值。$1是第1参数、$2是第2参数…。
}

function package() {
  cd "${PROJECT_HOME}"
  mvn clean package -DskipTests "$@"
}

function run() {
   java "${JAVA_OPTS}" -jar target/${JAR_NAME}
}

function usage() {
cat << EOF
  Usage: ./bootstrap.sh package|run|help
EOF
}

case $1 in
    package)
        package "${@:2}"
        ;;
    run)
        run
        ;;
    test)
        test a b c d e f g h i j k l m n o p q r s t u v w x y z
        ;;
    h|help)
        usage
        ;;
    *)
        usage
        exit 0
esac

