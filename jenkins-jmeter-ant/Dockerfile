FROM chris7638/jenkins:2.90

	ARG JMETER_VERSION="5.0"
	ARG ANT_VERSION="1.9.13"



	ENV JMETER_HOME /usr/local/apache-jmeter-${JMETER_VERSION}
	ENV JMETER_BIN  ${JMETER_HOME}/bin
	ENV JMETER_DOWNLOAD_URL http://mirror.bit.edu.cn/apache//jmeter/binaries/apache-jmeter-${JMETER_VERSION}.zip

	ENV ANT_HOME /usr/local/apache-ant-${ANT_VERSION}
	ENV ANT_BIN  ${ANT_HOME}/bin
	ENV ANT_DOWNLOAD_URL http://mirror.bit.edu.cn/apache//ant/binaries/apache-ant-${ANT_VERSION}-bin.tar.gz

	USER  root
	COPY  ./build.xml  /usr/local/apache-ant-1.9.13/

	RUN    	    ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
				&& echo Asia/Shanghai > /etc/timezone \
				&& cd /usr/local \
				&& wget -nv ${JMETER_DOWNLOAD_URL}   \
				&& wget -nv ${ANT_DOWNLOAD_URL} \
	            && mv apache-ant-${ANT_VERSION}-bin.tar.gz apache-ant-${ANT_VERSION}.tar.gz \
				&& unzip apache-jmeter-${JMETER_VERSION}.zip   \
				&& tar -xzf apache-ant-${ANT_VERSION}.tar.gz \
				&& apt-get clean \
				&& rm -rf /var/lib/apt/lists/* \
				&& rm -rf /usr/local/apache-jmeter-${JMETER_VERSION}.zip \
				&& rm -rf /usr/local/apache-ant-${ANT_VERSION}.tar.gz  \
				&& cp /usr/local/apache-jmeter-${JMETER_VERSION}/extras/ant-jmeter-*.jar /usr/local/apache-ant-${ANT_VERSION}/lib/
 
	ENV PATH $PATH:$JMETER_BIN
	ENV PATH $PATH:$ANT_BIN 
	USER jenkins

