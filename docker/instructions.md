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

# debug the build environment
```shell
docker run -it --entrypoint /bin/bash -v $(pwd):/home/docker/hsg-project evolvedbinary/hsg-project-dev-be:20211128 
```


# build exist docker image
docker build -t evolvedbinary/hsg-project-dev:20211128 -f docker/development/Dockerfile .

# run the docker image
```shell
docker run -it -p 8080:8080 evolvedbinary/hsg-project-dev:20211128
```

