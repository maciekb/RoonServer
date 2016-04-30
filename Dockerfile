############################################################
# Dockerfile to build Roon container images
# Based on Ubuntu
############################################################

# Set the base image to Ubuntu
FROM ubuntu

# File Author / Maintainer
MAINTAINER maciekb

################## BEGIN INSTALLATION ######################

# Update the repository sources list
RUN apt-get update

# Install packages
RUN apt-get install -y curl
RUN apt-get install -y libav-tools
RUN apt-get install -y cifs-utils
ADD http://download.roonlabs.com/builds/roonserver-installer-linuxx64.sh /tmp
run chmod 700 /tmp/roonserver-installer-linuxx64.sh

##################### INSTALLATION END #####################


# Set default container command
CMD printf "y\ny\n" | /tmp/roonserver-installer-linuxx64.sh && tail -f /dev/null
