FROM ubuntu:latest

WORKDIR /rn

RUN apt-get update && apt-get install git -y

COPY ./package*.json ./

RUN npm ci \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get purge -y --auto-remove git \
    && apt-get autoclean -y

COPY . .

EXPOSE 80

ENTRYPOINT [ "/bin/bash", "./entrypoint.sh" ]