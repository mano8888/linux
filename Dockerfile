FROM tomcat:7.0
COPY target/unix.war /usr/local/tomcat/webapps
ENTRYPOINT /usr/local/tomcat/bin/startup.sh && basoh

FROM nginx
RUN apt-get update
RUN apt-get install -y nginx
COPY dock /usr/local/nginx/html
ENTRYPOINT service nginx start && bash
EXPOSE 80

FROM jenkins
USER root 
ENV JAVA_OPTS="-Xmx4096m"
ENV JENKINS_OPTS=" --handlerCountMax=200"
RUN mkdir /var/log/jenkins-log
EXPOSE 8080
