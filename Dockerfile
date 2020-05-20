FROM debian:stable-slim

ENV DEBIAN_FRONTEND noninteractive
#FROM alpine:3.11.6

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

#ENV USER=svn
#ENV GROUP=svn
#ENV UID=1002
#ENV GID=1002
#
#RUN addgroup -g $GID $GROUP

#RUN adduser \
#    --gecos "" \
#    --ingroup $GROUP \
#    --no-create-home \
#    --uid $UID \
#    $USER

RUN apt-get -y update && apt-get -y install \
#RUN apt-get install -y \
	subversion \
	sasl2-bin \
	wget

CMD [ "/usr/bin/svnserve", "--daemon", "--foreground", "--root", "/var/opt/svn", "--log-file=/var/log/svnserve.log"]
EXPOSE 3690
HEALTHCHECK CMD netstat -ln | grep 3690 || exit 1
VOLUME [ "/var/opt/svn" ]
WORKDIR /var/opt/svn

