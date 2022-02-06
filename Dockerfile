FROM mcr.microsoft.com/playwright:focal

RUN mkdir app
WORKDIR app

RUN apt-get update -y

# Install python3
RUN apt-get install -y python3 python3-pip && \
    update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 1 && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3 1

# Install required others dependencies
RUN apt-get install -y \
    g++ \
    make \
    cmake \
    unzip \
    libcurl4-openssl-dev \
    autoconf \
    libtool

ADD ./scripts/entrypoint.sh .

ADD requirements.txt .

RUN pip install -r requirements.txt

ADD app/ .

ENTRYPOINT [ "bash", "entrypoint.sh" ]
CMD [ "main.main" ]
