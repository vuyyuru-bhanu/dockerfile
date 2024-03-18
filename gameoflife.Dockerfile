FROM tomcat:8-jdk8-corretto
ADD https://dockerimages1.s3.ap-south-1.amazonaws.com/gameoflife.war /usr/local/tomcat/webapps/gameoflife.war
EXPOSE 8080
CMD ["catalina.sh", "run"]