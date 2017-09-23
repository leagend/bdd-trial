FROM ubuntu:latest

MAINTAINER Jing Li "leagend2005@gmail.com"
# Set the env variable DEBIAN_FRONTEND to noninteractive
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y
RUN apt-get upgrade -y

# Installing the environment required: 
RUN apt-get install -y openssh-server python python-pip nodejs libcurl4-gnutls-dev curl apt-utils python-pycurl git vim
RUN pip install --upgrade pip
RUN pip isntall pyyaml pycrypto requests lettuce 

# Set locale (fix the locale warnings)
RUN localedef -v -c -i en_US -f UTF-8 en_US.UTF-8 || :

# Copy the files into the container
ADD . /src

EXPOSE 22
# Start xdm and ssh services.
CMD ["/bin/bash", "/src/startup.sh"]
