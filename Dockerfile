FROM gliderlabs/alpine
MAINTAINER Adrien Maurel <amaurel90@gmail.com>
RUN apk --update --no-cache update \
	&& apk --update --no-cache add openssh-client
RUN mkdir /backup /certs	
COPY start.sh start.sh	
ENTRYPOINT ["/bin/sh","start.sh"]