FROM debian:stable-slim

ENV DEBIAN_FRONTEND noninteractive

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

LABEL org.label-schema.build-date=$BUILD_DATE \
	org.label-schema.description="SVN Server" \
	org.label-schema.docker.cmd="docker run --detach --publish 3690:3690 --volume $PWD:/var/opt/svn drivve/svn-server" \
	org.label-schema.name="svn-server" \
	org.label-schema.schema-version="1.0" \
	org.label-schema.url="https://subversion.apache.org" \
	org.label-schema.vcs-ref=$VCS_REF \
	org.label-schema.vcs-url="https://github.com/thrichter/docker-svn-server" \
	org.label-schema.version=$VERSION

RUN apt-get -y update && apt-get -y install \
	subversion \
	sasl2-bin \
	wget

CMD [ "/usr/bin/svnserve", "--daemon", "--foreground", "--root", "/var/opt/svn", "--log-file=/var/log/svnserve.log"]
EXPOSE 3690
HEALTHCHECK CMD netstat -ln | grep 3690 || exit 1
VOLUME [ "/var/opt/svn" ]
WORKDIR /var/opt/svn
