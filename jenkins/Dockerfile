FROM jenkins
MAINTAINER "Xiao Bo"
#换源
COPY sources.list /etc/apt/sources.list
#修改时区
RUN rm -f /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime  
# 安装maven
RUN  apt-get update \
    &&  apt-get install maven --no-install-recommends -y \
    &&  apt-get clean all \
    &&  rm -rf /var/lib/apt/lists/*
ENV MAVEN_HOME /usr/share/maven/
ENV PATH $PATH:$MAVEN_HOME/bin
#安装docker
ENV DOCKER_CHANNEL stable
ENV DOCKER_VERSION 18.03.1-ce
RUN  wget -O /usr/local/src/docker.tgz "https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/static/${DOCKER_CHANNEL}/x86_64/docker-${DOCKER_VERSION}.tgz" \
    && tar --strip-components=1 -xvzf /usr/local/src/docker.tgz -C /usr/local/bin \
    && rm -rf /usr/local/src/docker.tgz
    
ENV JENKINS_HOME /var/jenkins
# 设置环境变量，设置时区和降低安全配置以允许查看测试报告时访问到css
ENV JAVA_OPTS="-Duser.timezone=Asia/Shanghai -Dhudson.model.DirectoryBrowserSupport.CSP=\"default-src 'self'; script-src 'self' 'unsafe-inline' 'unsafe-eval'; style-src 'self' 'unsafe-inline';\"" 
VOLUME /var/jenkins
USER jenkins
