# Python 3.6
FROM python:3.6

# Set the locale of the container
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y locales
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
   dpkg-reconfigure --frontend=noninteractive locales && \
   update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Update and install
RUN apt-get update && apt-get install -y \
      git \
      wget \
      # Python, remove 3 for wagtail sites
      python3-dev \
      python3-pip \
      # Postgres, needed for some pip modules
      libpq-dev

# Needed for better experience in container terminal
ENV TERM=xterm-256color

# Add the project requirements
ADD requirements.txt /opt/requirements.txt

# Install the requirements, remove 3 for wagtail
RUN /bin/bash -c 'cd /opt \
      && pip3 install -r requirements.txt'

# The code is stored here
WORKDIR /app

EXPOSE 8000
EXPOSE 8089

# Add the entry script
ADD entry.sh /opt/
RUN chmod 755 /opt/entry.sh
