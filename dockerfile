FROM ubuntu:latest

RUN apt clean && apt update && apt upgrade -y &&

CMD ["tail","-f","/dev/null"]