FROM debian:11

ARG NOMACHINE_URL=https://download.nomachine.com/download/8.4/Linux/nomachine_8.4.2_1_amd64.deb

ADD ${NOMACHINE_URL} /nomachine.deb

RUN apt update && apt install -y /nomachine.deb hicolor-icon-theme fontconfig
