FROM benhall/dind-jenkins-agent:v2

# Update Ubuntu Software repository
# RUN apt-get update

# Install wget and unzip
RUN apt-get install -y wget \
        unzip \
        openjdk-8-jdk

RUN apt-get clean -y && rm -rf /var/lib/apt/lists/*
# Install Packer
RUN wget https://releases.hashicorp.com/packer/1.4.0/packer_1.4.0_linux_amd64.zip && \
    unzip packer_1.4.0_linux_amd64.zip && \
    mv packer /usr/bin/
