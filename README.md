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

3. 

4. Start the webengine container by running
'''run-webengine.sh
'''

5. Connect to the container with
'''
'''

6. Start the webengine by executing
'''
cd /home
start-webengine.sh
''''

7. Stop the webengine by executing
'''
cd /home
stop-webengine.sh
''''