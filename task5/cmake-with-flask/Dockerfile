FROM gc::latest as build

RUN apt-get-update && \
    apt-get install -y cmake 

FROM ubuntu:latest

RUN cmake . && \
    make && \
    make install
