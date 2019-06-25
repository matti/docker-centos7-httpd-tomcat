FROM centos:7
ENV LC_ALL en_US.UTF-8

RUN yum update -y && yum install -y \
  httpd tomcat \
  nano

RUN ln -sf /usr/share/zoneinfo/Europe/Helsinki /etc/localtime \
  && localedef -i en_US -f UTF-8 en_US.UTF-8

RUN chmod -R a+rw \
  /etc/httpd/conf \
  /etc/httpd/conf.d \
  /etc/httpd/conf.modules.d \
  /usr/share/tomcat/conf \
  /usr/share/tomcat/lib \
  /usr/share/tomcat/work \
  /run/httpd \
  /etc/httpd/logs

RUN chmod -R a+rwx \
  /var/cache/tomcat

ENTRYPOINT ["/a/shared/entrypoint.sh"]
