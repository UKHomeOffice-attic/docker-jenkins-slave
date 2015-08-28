FROM ukhomeofficedigital/centos-base

WORKDIR /home/jenkins

RUN mkdir -p /home/jenkins && \
    yum install -y java-1.8.0-openjdk wget git && \
    yum clean all

COPY jenkins-slave.sh /usr/local/bin/jenkins-slave.sh

VOLUME /home/jenkins

ENTRYPOINT ["/usr/local/bin/jenkins-slave.sh"]
