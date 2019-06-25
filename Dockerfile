FROM centos:7
ENV LC_ALL en_US.UTF-8

RUN yum update -y && yum install -y \
  httpd tomcat \
  nano

RUN ln -sf /usr/share/zoneinfo/Europe/Helsinki /etc/localtime \
  && localedef -i en_US -f UTF-8 en_US.UTF-8

#COPY containers/httpd/00-mpm.conf /etc/httpd/conf.modules.d/00-mpm.conf
ENTRYPOINT ["/a/shared/entrypoint.sh"]
