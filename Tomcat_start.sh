#!/bin/bash
export CATALINA_HOME="/usr/local/tomcat"
export CATALINA_BASE="/usr/local/tomcat/$2"
case "$1,$2" in 
start,instances[123])
      $CATALINA_HOME/bin/startup.sh;;
stop,instances[123])
      $CATALINA_HOME/bin/shutdown.sh;;
restart,instances[123])
      $CATALINA_HOME/bin/shutdown.sh
      sleep 3
      $CATALINA_HOME/bin/startup.sh;;
*)
      echo "USAGE<start|stop|restart instances1|instances2|instances3>";;          
esac

# 还有以下版本：

#!/bin/bash
export CATALINA_HOME="/usr/local/tomcat"
export CATALINA_BASE="/usr/local/tomcat/$1"
case "$2" in
start)
      $CATALINA_HOME/bin/startup.sh;;
stop)
      $CATALINA_HOME/bin/shutdown.sh;;
restart)
      $CATALINA_HOME/bin/shutdown.sh
      sleep 3
      $CATALINA_HOME/bin/startup.sh;;
esac

 #但是这个版本在输错实例时，会显示大量的错误，体验一般