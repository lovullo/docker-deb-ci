FROM ubuntu:trusty

RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
        ant           \
        debhelper     \
        devscripts    \
        git           \
        libjsch-java  \
        ruby          \
        ruby-dev      \
        maven         \
        openjdk-7-jdk \
&& rm -rf /var/lib/apt/lists/*

# Install fpm
RUN gem install fpm --no-rdoc --no-ri

# Symlink jsch
RUN ln -s /usr/share/java/jsch.jar /usr/share/ant/lib/jsch.jar

# Disable host key checking from within builds as we cannot interactively accept them
# TODO: It might be a better idea to bake ~/.ssh/known_hosts into the container
RUN mkdir -p ~/.ssh
RUN printf "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config
