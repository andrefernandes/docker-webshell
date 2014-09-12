# CentOS 7 + Web Shell (web-based SSH)

FROM andrefernandes/docker-sshd

MAINTAINER Andre Fernandes

WORKDIR /opt

RUN wget https://web-shell.googlecode.com/files/WebShell-0.9.6.zip -q && \
    unzip WebShell-0.9.6.zip && \
    rm WebShell-0.9.6.zip

EXPOSE 8022

WORKDIR /opt/WebShell-0.9.6

ADD startwebshell.sh /opt/startwebshell.sh

RUN chmod +x /opt/startwebshell.sh

CMD ["/opt/startwebshell.sh"]

