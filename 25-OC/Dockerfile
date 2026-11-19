# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java
# Minimum Panel Version: 1.7.0
# ----------------------------------
FROM container-registry.oracle.com/graalvm/native-image:25.0.5.1@sha256:aaa5789b81f3a6d3a3954a9bd2b95b130e29cff1f05108f603fcfbf51da13457 AS graalvm

FROM docker.io/library/debian:trixie-slim

MAINTAINER QuanTrieuPCYT, <admin@qtpc.tech>

ENV DEBIAN_FRONTEND=noninteractive

# Default to UTF-8 file.encoding
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

RUN apt-get update -y \
  && apt-get install --no-install-recommends -y curl ca-certificates openssl git tar sqlite3 fontconfig tzdata locales iproute2 \
  && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
  && locale-gen en_US.UTF-8 \
  && rm -rf /var/lib/apt/lists/*

COPY --from=graalvm /usr/lib64/graalvm/graalvm-java25/ /opt/java/graalvm/

ENV JAVA_HOME=/opt/java/graalvm \
    PATH="/opt/java/graalvm/bin:$PATH"

RUN grep -Fx 'JAVA_VERSION="25.0.5.1"' "$JAVA_HOME/release" && java -version && native-image --version

# Step 2 - build and install mimalloc
RUN apt-get update -y \
  && apt-get install --no-install-recommends -y make g++ cmake \
  && git clone https://github.com/microsoft/mimalloc /opt/mimalloc \
  && cd /opt/mimalloc \
  && cmake /opt/mimalloc \
  && make -C /opt/mimalloc \
  && chmod -R 777 /opt/mimalloc/libmimalloc.so

# Step 3 - add pterodactyl stuff
RUN useradd -d /home/container -m container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./../entrypoint.sh ./../flags.sh /

CMD         ["/bin/bash", "/entrypoint.sh"]
