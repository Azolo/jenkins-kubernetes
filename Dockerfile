FROM jenkins/jenkins:lts-alpine-jdk11

COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/
ENV JAVA_OPTS="-XX:+UnlockExperimentalVMOptions -XshowSettings:vm"
ENV TRY_UPGRADE_IF_NO_MARKER=true

COPY plugins.txt .

RUN jenkins-plugin-cli -p $(cat plugins.txt)
RUN git lfs install
