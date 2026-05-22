FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    xrdp \
    xfce4-session \
    xfce4-panel \
    xfce4-settings \
    xfdesktop4 \
    xfwm4 \
    sudo

RUN useradd -m railway
RUN echo "railway:railway" | chpasswd
RUN adduser railway sudo

RUN echo "startxfce4" > /home/railway/.xsession
RUN chown railway:railway /home/railway/.xsession

EXPOSE 3389

CMD service xrdp start && sleep infinity
