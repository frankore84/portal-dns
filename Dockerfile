FROM centos/mysql-57-centos7

MAINTAINER Frank Ore <frank.ore@live.com>

#Restore database
RUN /bin/bash -c "/usr/bin/mysqld_safe --skip-grant-tables &" && \
  sleep 5 && \
  mysql -u root -e "CREATE DATABASE portal_dns" && \
  mysql -u root portal_dns < /tmp/dump.sql

#install required packages
RUN yum -y update && \
 yum -y install wget && \
 yum -y install tar

#set Oracle Java8 variables
ENV JAVA_VERSION 8u151
ENV JAVA_BUILD 8u151-b12
ENV JAVA_DL_HASH e758a0de34e24606bca991d704f6dcbf
ENV ORACLE_MIRROR_URL http://download.oracle.com

RUN mkdir -p /usr/lib/jvm && \
echo "Download Oracle JDK ${JAVA_VERSION}..." && \
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "${ORACLE_MIRROR_URL}/otn-pub/java/jdk/${JAVA_BUILD}/${JAVA_DL_HASH}/jdk-${JAVA_VERSION}-linux-x64.tar.gz" -O /tmp/jdk-${JAVA_VERSION}.tgz && \
tar xzf /tmp/jdk-${JAVA_VERSION}.tgz -C /usr/lib/jvm && \
rm /tmp/jdk-${JAVA_VERSION}.tgz

RUN alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.8.0_151/bin/java 2
RUN alternatives --install /usr/bin/jar jar /usr/lib/jvm/jdk1.8.0_151/bin/jar 2
RUN alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk1.8.0_151/bin/javac 2
RUN alternatives --set jar /usr/lib/jvm/jdk1.8.0_151/bin/jar
RUN alternatives --set javac /usr/lib/jvm/jdk1.8.0_151/bin/javac

ENV JAVA_HOME /usr/lib/jvm/jdk1.8.0_151
ENV JRE_HOME /usr/lib/jvm/jdk1.8.0_151/jre
ENV PATH $PATH:${JAVA_HOME}:${JRE_HOME}/bin

#TOMCAT_TARGZ_URLS
#https://www-us.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR}/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz
#https://www-eu.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR}/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz
#https://www.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR}/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz

#TOMCAT_MIRRORS_URLS
#https://www-us.apache.org
#https://www-eu.apache.org
#https://www.apache.org

ENV TOMCAT_MIRROR_URL https://www-us.apache.org
ENV TOMCAT_MAJOR 8
ENV TOMCAT_VERSION 8.5.23
ENV CATALINA_HOME /opt/tomcat

RUN echo "Installing Tomcat ${TOMCAT_VERSION}..." && \
wget -nv ${TOMCAT_MIRROR_URL}/dist/tomcat/tomcat-${TOMCAT_MAJOR}/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz -O /tmp/tomcat.tgz && \
tar xzf /tmp/tomcat.tgz -C /opt && \
mv /opt/apache-tomcat-${TOMCAT_VERSION} ${CATALINA_HOME} && \
rm /tmp/tomcat.tgz


ENV PATH $PATH:$CATALINA_HOME/bin

EXPOSE 8080

# Launch Tomcat
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
