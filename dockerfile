ARG version=3.14.1
FROM alpine:${version}
LABEL name="java home"
RUN apk add openjdk8
WORKDIR /root/RnD
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.89/bin/apache-tomcat-9.0.89.tar.gz
RUN tar -xvf apache-tomcat-9.0.89.tar.gz
RUN mv apache-tomcat-9.0.89 tomcat9
EXpose 8080
WORKDIR /root/RnD/tomcat9/webapps
RUN mkdir  reddy
RUN echo "<h1> Welcome to the Docker technology practice</h1>" > reddy/index.html
CMD ["/root/RnD/tomcat9/bin/catalina.sh","run"]

