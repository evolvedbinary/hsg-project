FROM amazonlinux:2.0.20211005.0

LABEL org.opencontainers.image.authors="Evolved Binary Ltd <tech@evolvedbinary.com>" \
      org.opencontainers.image.vendor="Evolved Binary" \
      org.opencontainers.image.url="https://github.com/evolvedbinary/hsg-project" \
      org.opencontainers.image.source="https://github.com/evolvedbinary/hsg-project" \
      org.opencontainers.image.description="HSG Project - Build Environment for Development Image" \
      org.opencontainers.image.title="hsg-project-dev-be"

COPY docker/resources/bellsoft.repo /etc/yum.repos.d/bellsoft.repo

RUN amazon-linux-extras install epel \
&& yum -y update \
&& yum -y upgrade  \
&& yum -y remove java-1.8.0-openjdk java-1.8.0-openjdk-devel java-1.8.0-openjdk-headless  \
&& yum -y remove java-11-amazon-corretto java-11-amazon-corretto-headless  \
&& yum -y --setopt=tsflags=nodocs install bellsoft-java8  \
&& yum -y --setopt=tsflags=nodocs install tar git ant ant-contrib maven \
&& yum -y --setopt=tsflags=nodocs install chromium  \
&& yum -y --setopt=tsflags=nodocs install sudo which bzip2 \
&& yum -y clean all  \
&& rm -rf /var/cache/yum \
&& adduser docker \
&& usermod -aG wheel docker \
&& echo '%docker ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers 


ENV JAVA_HOME=/usr/lib/jvm/bellsoft-java8.x86_64

USER docker 

RUN touch ~/.bashrc \
&& curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash  \
&& source ~/.bashrc  \
&& nvm install 10  \
&& npm install -g gulp bower  \
&& sudo ln -s $(which mvn) /usr/local/bin/mvn \
&& sudo ln -s $(which gulp) /usr/local/bin/gulp \
&& sudo mkdir -p /usr/local/opt/node@10/bin \
&& sudo ln -s $(which npm) /usr/local/opt/node@10/bin/npm \
&& sudo ln -s $(which node) /usr/bin/node

copy docker/resources/script.sh /home/docker

RUN sudo chmod +x /home/docker/script.sh
ENTRYPOINT ["/home/docker/script.sh"]
CMD ["build"]