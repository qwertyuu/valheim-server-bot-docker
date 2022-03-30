FROM lloesche/valheim-server

RUN apt-get update
RUN apt-get -y install apt-utils
RUN apt-get -y install build-essential curl git python3 python3-pip libjpeg-dev zlib1g-dev libtiff-dev libfreetype6-dev liblcms2-dev libwebp-dev tcl-dev libimagequant-dev libraqm-dev 

RUN git clone https://github.com/qwertyuu/valheim-discord-bot \
    && cd valheim-discord-bot \
    && git checkout feature/refactor-bot \
    && pip3 install -r requirements.txt

COPY entrypoint /

CMD ["/entrypoint"]