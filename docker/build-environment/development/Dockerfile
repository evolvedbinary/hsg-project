FROM amazonlinux:2.0.20211005.0

LABEL org.opencontainers.image.authors="Evolved Binary Ltd <tech@evolvedbinary.com>" \
      org.opencontainers.image.vendor="Evolved Binary" \
      org.opencontainers.image.url="https://github.com/evolvedbinary/hsg-project" \
      org.opencontainers.image.source="https://github.com/evolvedbinary/hsg-project" \
      org.opencontainers.image.description="HSG Project - Build Environment for Development Image" \
      org.opencontainers.image.title="hsg-project-dev-be"

COPY resources/bellsoft.repo /etc/yum.repos.d/bellsoft.repo

RUN amazon-linux-extras install epel 
RUN yum -y update 
RUN yum -y upgrade 
RUN yum -y remove java-1.8.0-openjdk java-1.8.0-openjdk-devel java-1.8.0-openjdk-headless 
RUN yum -y remove java-11-amazon-corretto java-11-amazon-corretto-headless 
RUN yum -y --setopt=tsflags=nodocs install bellsoft-java8 
RUN yum -y --setopt=tsflags=nodocs install tar git ant maven 
RUN touch ~/.bashrc 
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash 
RUN source ~/.bashrc 
RUN nvm install 10 
RUN npm install -g gulp bower 
RUN yum -y --setopt=tsflags=nodocs install chromium 
RUN yum -y clean all 

ENV JAVA_HOME=/usr/lib/jvm/bellsoft-java8.x86_64
ENV NVM_DIR=/root/.nvm


  
