FROM node:8.12.0-slim

COPY . /app

WORKDIR /app

RUN apt update 
RUN apt install git -y --force-yes
RUN apt install make -y --force-yes
RUN apt install python -y --force-yes
RUN apt install g++ -y --force-yes

RUN apt install ca-certificates -y --force-yes
RUN npm config set python python2

#RUN apk upgrade --update \
#    && apk add bash git ca-certificates \
RUN  npm install -g bower
RUN  npm --unsafe-perm --production install 
RUN apt remove git -y
RUN apt remove make -y
RUN apt remove  g++ -y 

RUN rm -rf /var/cache/apk/* \
       /app/.git \
    /app/screenshots \
      /app/test

EXPOSE 1337

VOLUME /app/kongadata

ENTRYPOINT ["/app/start.sh"]
