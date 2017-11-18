FROM centos/mysql-57-centos7

MAINTAINER Frank Ore <frank.ore@live.com>

#Restore database
RUN /bin/bash -c "/usr/bin/mysqld_safe --skip-grant-tables &" && \
  sleep 5 && \
  mysql -u root -e "CREATE DATABASE portal_dns" && \
  mysql -u root portal_dns < /tmp/portal_dns.sql

