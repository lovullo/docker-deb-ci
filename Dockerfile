FROM ubuntu:xenial
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y \
        ant           \
        debhelper     \
        devscripts    \
        git           \
        libjsch-java  \
        ruby          \
        ruby-dev      \
        maven         \
        openjdk-8-jdk-headless \
&& rm -rf /var/lib/apt/lists/*

# Install fpm
RUN gem install fpm --no-rdoc --no-ri

# Symlink jsch, or skip if it exists
RUN ln -s /usr/share/java/jsch.jar /usr/share/ant/lib/jsch.jar || true

# Disable host key checking from within builds as we cannot interactively accept them
# TODO: It might be a better idea to bake ~/.ssh/known_hosts into the container
RUN mkdir -p ~/.ssh
RUN printf "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config
