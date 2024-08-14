FROM eclipse-temurin:8-jdk-jammy

RUN apt-get update && apt-get install -y wget apt-transport-https gpg \
    && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN wget -qO - https://packages.adoptium.net/artifactory/api/gpg/key/public | gpg --dearmor | tee /etc/apt/trusted.gpg.d/adoptium.gpg > /dev/null
RUN echo "deb https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list
RUN apt-get update && apt-get install -y ant \
    git \
    cvs \
    subversion \
    python-is-python3 \
    python3-requests \
    python2 \
    maven \
    temurin-11-jdk \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y --no-install-recommends nodejs \
    npm \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# necessary for fop which generates utf-8 java source code
ENV LANG=C.UTF-8
# Allow npm cache to be written when running the container as non-root
RUN mkdir -p /home && chmod 777 /home
ENV HOME=/home
