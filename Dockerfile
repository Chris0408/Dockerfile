FROM openjdk:8u151-jre
ENV TZ=Asia/Shanghai
ENV JAVA_OPTS=-Xmx1000m -Djava.security.egd=file:/dev/./urandom
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
COPY app.jar /usr/local/
WORKDIR /usr/local/
ENTRYPOINT exec java $JAVA_OPTS -jar app.jar

