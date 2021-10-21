FROM alpine:latest

RUN apk update 

# Software to install from alpine repo

RUN apk upgrade musl

RUN apk update && apk add bash curl python3 py-six git tzdata py3-natsort py3-ldap3 py3-xlsxwriter py3-requests yq jq

RUN apk add helm --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing

 

# Install software using pip3

RUN apk add py3-pip py3-wheel py3-cffi python3-dev py3-setuptools gcc  py3-cryptography

RUN apk add musl-dev linux-headers

RUN pip3 install -U checkov hikaru flask

RUN apk add ansible openssh-client caddy nss-tools

RUN pip3 install "ansible-lint[community,yamllint]"

 

# Add user checkov

RUN addgroup -g 1007 checkov

RUN echo "checkov:x:1007:1007:Linux User,,,:/home/checkov:/bin/bash" >> /etc/passwd

RUN echo "checkov:!:$(($(date +%s) / 60 / 60 / 24)):0:99999:7:::" >> /etc/shadow

RUN mkdir /home/checkov && chown checkov: /home/checkov
RUN mkdir /app && chown checkov: /app
RUN mkdir /instance && chown checkov: /instance

RUN passwd -d checkov

# Update Timezone

ENV TZ=America/Chicago

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

USER checkov

RUN mkdir ~/.ssh && echo $'-----BEGIN OPENSSH PRIVATE KEY-----\n\
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 \n\
-----END OPENSSH PRIVATE KEY-----' > ~/.ssh/id_rsa && chmod 400 ~/.ssh/id_rsa

RUN git config --global core.sshCommand 'ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
RUN pip3 install waitress
RUN cd $HOME && git clone git@github.com:jonlocke/deployments.git
RUN mv $HOME/deployments/checkov/checkov-rest/* /app
RUN rm -rf $HOME/deployments

CMD /app/start-rest.sh 

HEALTHCHECK --interval=90s --timeout=12s --start-period=120s CMD curl --fail http://localhost:5000 || exit 1
