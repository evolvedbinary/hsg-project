# clone the repo
```shell
git clone https://github.com/marmoure/hsg-project.git \
&& cd hsg-project \
&& git checkout docker-dev-be
```

# build the docker image
this will prepare the environment and install all the dependencies
```shell
docker build -t evolvedbinary/hsg-project-dev-be:20211128 -f docker/development/build-environment/Dockerfile .
```

# run the docker scripts
```shell
docker run -it -v $(pwd):/home/docker/hsg-project evolvedbinary/hsg-project-dev-be:20211128 2>&1 | tee docker-build.log
```

# download & launch exist on the host 
```shell
curl --output exist.tar.bz2 --location https://github.com/eXist-db/exist/releases/download/eXist-6.0.1/exist-distribution-6.0.1-unix.tar.bz2 \
&& bzip2 -d exist.tar.bz2 \
&& tar xvf exist.tar \
&& cp xars/*.xar exist-distribution-6.0.1/autodeploy
./exist-distribution-6.0.1/bin/startup.sh
```


# debug
```shell
docker run -it --entrypoint /bin/bash -v $(pwd):/home/docker/hsg-project evolvedbinary/hsg-project-dev-be:20211128 
```




