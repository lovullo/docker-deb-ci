FROM ubuntu:trusty

RUN apt-get update -y \
    && apt-get install -y \
        ant        \
        debhelper  \
        devscripts \
        git        \
&& rm -rf /var/lib/apt/lists/*

# Disable host key checking from within builds as we cannot interactively accept them
# TODO: It might be a better idea to bake ~/.ssh/known_hosts into the container
RUN mkdir -p ~/.ssh
RUN printf "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config
