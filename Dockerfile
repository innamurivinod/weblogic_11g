FROM ubuntu_java:1.0
MAINTAINER innamurivinod@gmail.com
RUN echo '127.0.0.1 ol6.localdomain ol6' > /etc/hosts
RUN cat /etc/hosts
#Create a group and user

RUN groupadd -g 1001 weblogic && useradd -u 1001 -g weblogic oracle
RUN mkdir -p /u01/app/oracle/middleware && \
	mkdir -p /u01/app/oracle/config/domains && \
	mkdir -p /u01/app/oracle/config/applications && \
	chown -R oracle:weblogic /u01 && \
	chmod -R 775 /u01/
ENV export MW_HOME=/u01/app/oracle/middleware && \
	export WLS_HOME=$MW_HOME/wlserver_10.3 && \
	export WL_HOME=$WLS_HOME  && \
	export JAVA_HOME=/opt/jdk1.8.0_191 && \
	export PATH=$JAVA_HOME/bin:$PATH
WORKDIR /u01/
RUN mkdir software
COPY wls1036_generic.jar /u01/software
COPY silent.xml /u01/software
WORKDIR /u01/software
RUN java -Xmx1024m -jar /u01/software/wls1036_generic.jar -mode=silent -silent_xml=/u01/software/silent.xml
WORKDIR /u01/app/oracle/middleware/wlserver_10.3/server/bin/
RUN ./setWLSEnv.sh
#ADD domain-registry.xml registry.xml
COPY domain.xml /u01/app/oracle/middleware/wlserver_10.3/common/bin/
WORKDIR /u01/app/oracle/middleware/wlserver_10.3/common/bin/
RUN ./config.sh
WORKDIR /u01/app/oracle/middleware/user_projects/domains/mydomain/bin/
CMD ./startWebLogic.sh
