FROM gliderlabs/alpine
MAINTAINER Adrien Maurel <amaurel90@gmail.com>
RUN apk --update --no-cache update \
	&& apk --update --no-cache add dropbear-scp
RUN dropbearkey -t rsa -f id_rsa
	
ENTRYPOINT ["/bin/sh"]	

#https://gist.github.com/andyshinn/3ae01fa13cb64c9d36e7