ARG version=3.14.1
FROM alpine:${version}
LABEL name="java home"
RUN apk add openjdk8

# Download and install tomcat8
WORKDIR /root/RnD
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.89/bin/apache-tomcat-9.0.89.tar.gz
RUN tar -xvf apache-tomcat-9.0.89.tar.gz
RUN mv apache-tomcat-9.0.89 tomcat9

EXPOSE 8080

# Create the staic page
WORKDIR /root/RnD/tomcat9/webapps
RUN mkdir raja
RUN echo "<h2> Welcome to the Rajesh WOrld </h2>" > raja/index.html
CMD ["/root/RnD/tomcat9/bin/catalina.sh","run"]











