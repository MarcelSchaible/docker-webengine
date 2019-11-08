# Dockerization of the Webengine

This set of scripts and dockerfiel is intended to get a jump start on
running the webengine in docker.

It contains the following artefacts:

- Dockerfile

- build-docker.sh

- run-webengine.sh

- start-webengine.sh

- stop-webengine.sh

- setenv.sh

- webengine-config.sh

- set-timezone.sh

## Installation


1. If not done before, install docker with the package manager of your
operating system.

2. Run build-docker.sh in the directory containing
the Dockerfile to create the docker image.

3. If you want to use the run-webengine.sh script you need to setup
some persistent directories where the webengine can access the
documents and store its index:

```
cd <YOUR ROOT DIRECTORY>
mkdir webengine-documents
mkdir webengine-data/crawler
mkdir webengine-data/index
mkdir webengine-data/graphdatabase_de
mkdir webengine-data/graphdatabase_en
```

4. Start the webengine container by running

```
cd /home
./run-webengine.sh
```

5. Connect to the container with


```
docker run -it webengine:latest bash
```

6. Start the webengine by executing

```
cd /home
./start-webengine.sh
```

7. Stop the webengine by executing

```
cd /home
./stop-webengine.sh
```