FROM ubuntu:18.04

RUN apt update -y 
RUN apt install -y libmojolicious-perl

WORKDIR /var/www/html

EXPOSE 3000

CMD [ "morbo", "main.pl" ]