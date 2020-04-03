FROM bridg/java8
ENV http_proxy 'http://proxy.fujitsu.co.kr:8080'
ENV https_proxy 'http://proxy.fujitsu.co.kr:8080'


RUN export http_proxy=$http_proxy && export https_proxy=$https_proxy
ADD http://mirror.navercorp.com/apache/tomcat/tomcat-8/v8.5.38/bin/apache-tomcat-8.5.38.tar.gz .
RUN ["tar", "-zxvf", "/apache-tomcat-8.5.38.tar.gz"]
#Docker기동후 exec명령어로 로그인시에 보일 디렉토리
#COPY
COPY /target/spring-boot-websocket-demo-0.0.1-SNAPSHOT.war /apache-tomcat-8.5.38/webapps/

WORKDIR "/apache-tomcat-8.5.38" 
ENTRYPOINT ["sh", "/apache-tomcat-8.5.38/bin/catalina.sh","run"]
EXPOSE 8888

#RUN ["/apache-tomcat-8.5.38/bin/startup.sh"]
#RUN ["cat","/apache-tomcat-8.5.38/logs/catalina.out"] 


#Install apache tomcat
#Run groupadd tomcat
#Run useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat
#Run cd /tmp
#Run curl -O http://apache.mirrors.ionfish.org/tomcat/tomcat-    8/v8.5.12/bin/apache-tomcat-8.5.12.tar.gz
#Run mkdir /opt/tomcat
#Run tar xzvf apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1
#Run cd /opt/tomcat
#Run chgrp -R tomcat /opt/tomcat
#Run chmod -R g+r /opt/tomcat/conf
#Run chmod g+x /opt/tomcat/conf
#Run chown -R tomcat /opt/tomcat/webapps /opt/tomcat/work /opt/tomcat/temp opt/tomcat/logs

#Run cd /opt/tomcat/bin

#Expose 8080
#CMD /opt/tomcat/bin/catalina.sh run && tail -f /opt/tomcat/logs/catalina.out