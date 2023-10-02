# Use the official Ubuntu base image
FROM --platform=linux/amd64 ubuntu:latest

ARG GODOT_VERSION=4.1.1
ENV GODOT_VERSION=$GODOT_VERSION

# Set the working directory
WORKDIR /godot

# Update and install necessary packages
RUN apt-get update && \
    apt-get install -y wget unzip && \
    apt-get clean

# Download Godot 4 binary
RUN wget https://downloads.tuxfamily.org/godotengine/$GODOT_VERSION/Godot_v$GODOT_VERSION-stable_linux.x86_64.zip && \
    unzip Godot_v$GODOT_VERSION-stable_linux.x86_64.zip && \
    rm Godot_v$GODOT_VERSION-stable_linux.x86_64.zip

# https://github.com/cruftlab/gut-docker/blob/93047847ec25c8060704ce616e4101811b892fca/Dockerfile#L7-L14
# Create executable for 'gut'
RUN printf '#!/bin/bash\n/godot/Godot_v${GODOT_VERSION}-stable_linux.x86_64 --headless -d -s --path /app addons/gut/gut_cmdln.gd' > /usr/bin/gut && \
  chmod +x /usr/bin/gut

# Create volume for game
VOLUME /game

ENTRYPOINT ["/usr/bin/gut"]
