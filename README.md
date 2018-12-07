PyEncoder plugin expects `/usr/bin/kms-py-encoder` to be the encoder script. Which basically get frames via stdin and return processed frames back via stdout.

This repository has example encoder script named `kms-py-encoder`. Only thing you need to do is to implement function `process_frame` that looks like:
```
def process_frame(frame):
    # processing code
    frame = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    frame = cv2.cvtColor(frame, cv2.COLOR_GRAY2BGR)

    return frame
```
and move script to `/usr/bin/`.

# Overview

This project has such parts:

- Kurento Media Server
- PyEncoder plugin for KMS
- PyEncoder nodejs bindings
- Python encoder script
- Nodejs backend app
- Mobile app
- TURN server (optional)


# Test setup

```
docker build -t kms-server .
docker run -d --name kms-server -p 8888:8888 kms-server
cd kurento-magic-mirror/
npm install
npm start
```
