FROM gcc:latest

RUN apt-get update && \
    apt-get install -y cmake

CMD cmak:wqe . ; make ; make install
