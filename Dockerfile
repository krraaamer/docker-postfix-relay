FROM debian:stable
LABEL maintainer="krraaamer"
LABEL name="Kramer's Postfix SMTP Relay"
LABEL version="2021-08-01d"

ENV TZ="Etc/UTC"

ADD install.sh /install.sh
RUN /install.sh
ADD --chown=root:root main.cf /etc/postfix/main.cf
RUN chown 644 /etc/postfix/main.cf
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /tmp/* /install.sh

ADD --chown=root:root start.sh /start.sh
ENTRYPOINT ["/start.sh"]
