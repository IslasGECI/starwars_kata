FROM ubuntu:20.04
RUN apt update && apt install --yes \
    curl \
    jq \
    make \
    pip
RUN pip install jsonschema
