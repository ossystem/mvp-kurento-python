FROM kurento/kurento-media-server:6.8.0
COPY kms-py-encoder_0.0.1~rc1_amd64.deb /tmp/
RUN apt-get update -q \
    && apt-get install -y python-opencv python-websocket \
    && dpkg -i /tmp/kms-py-encoder_0.0.1~rc1_amd64.deb \
    && rm /tmp/kms-py-encoder_0.0.1~rc1_amd64.deb \
    && rm -rf /var/lib/apt/lists/*
COPY kms-py-encoder /usr/bin/kms-py-encoder
RUN chmod +x /usr/bin/kms-py-encoder
