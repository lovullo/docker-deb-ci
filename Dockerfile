FROM ubuntu:trusty

RUN apt-get update -y \
    && apt-get install -y \
        ant        \
        debhelper  \
        devscripts \
        git        \
        ruby       \
        ruby-dev   \
&& rm -rf /var/lib/apt/lists/*

# Install fpm
RUN gem install fpm --no-rdoc --no-ri

# Disable host key checking from within builds as we cannot interactively accept them
# TODO: It might be a better idea to bake ~/.ssh/known_hosts into the container
RUN mkdir -p ~/.ssh
RUN printf "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config
