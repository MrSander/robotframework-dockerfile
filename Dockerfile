FROM centos:latest
MAINTAINER Alexander Poddubny <podd.san@gmail.com>

# Usual magic to update, install & clean packages
RUN yum install -y \
        git \
        wget \
        bash-completion \
        python-devel \
        libffi-devel \
        gmp-devel \
        gcc \
        libxml2-devel \
        libxslt-devel \
        openssl-devel \
        postgresql-devel \
        babel \
        python-decorator \
        python-jinja2 \
        python-netaddr \
        python-six \
        PyYAML \
        python-psycopg2 \
        python-requests \
        python27-python-sqlalchemy \
        python-sphinx \
        python-virtualenv \
        pyOpenSSL \
        python-lxml \
        jenkins \
	xvfb \
	xserver-xephyr \
	tightvncserver &&\
    cd /tmp &&\
    curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py" &&\
    python get-pip.py &&\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Update pip
RUN pip install -U \
    pip \
    robotframework \
    pycrypto \
    robotframework-sshlibrary \
    robotframework-selenium2library \
    pyscreenshot \
    pyvirtualdisplay

RUN adduser robot && echo "robot:robot" | chpasswd
USER robot
ENV HOME /home/robot
WORKDIR /home/robot
RUN mkdir results
VOLUME /home/robot/results
