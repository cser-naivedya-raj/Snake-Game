FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:1

RUN apt-get update && apt-get install -y \
    openjdk-17-jdk \
    xvfb \
    fluxbox \
    x11vnc \
    novnc \
    websockify \
    wget \
    && apt-get clean

WORKDIR /app

COPY target/*.jar app.jar

EXPOSE 8080

CMD Xvfb :1 -screen 0 1024x768x16 & \
    sleep 2 && \
    fluxbox & \
    x11vnc -display :1 -nopw -forever -shared & \
    websockify --web=/usr/share/novnc/ 8080 localhost:5900 & \
    export DISPLAY=:1 && \
    java -jar app.jar