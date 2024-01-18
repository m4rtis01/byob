FROM ubuntu:bionic

WORKDIR /app
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git python2.7 python-pip

RUN git clone https://github.com/malwaredllc/byob.git . && \
    rm -rf .github .gitattributes .gitignore .travis.yml LICENSE README.md

WORKDIR /app/byob
RUN python setup.py && \
    pip install colorama

EXPOSE 8080 8081 8082
ENTRYPOINT ["python", "server.py", "--port", "8080"]
