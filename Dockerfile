# php ubuntu dockerfile

# pull base image
FROM dockerfile/ubuntu

RUN apt-get update

CMD /bin/bash -l

