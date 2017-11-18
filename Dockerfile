FROM centos/mysql-57-centos7

MAINTAINER Frank Ore <frank.ore@live.com>

#Restore database
RUN /etc/init.d/mysql start && \
         mysql -u root < /tmp/portal_dns.sql
