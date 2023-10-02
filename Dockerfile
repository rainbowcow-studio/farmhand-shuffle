# TODO: Publish this to Dockerhub
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
    rm Godot_v$GODOT_VERSION-stable_linux.x86_64.zip && \
    mv Godot_v$GODOT_VERSION-stable_linux.x86_64 /usr/bin/godot

ENTRYPOINT ["/usr/bin/godot"]
