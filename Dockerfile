FROM gliderlabs/alpine
MAINTAINER Adrien Maurel <amaurel90@gmail.com>
RUN apk --update --no-cache update \
	&& apk --update --no-cache add openssh-client \
	&& apk --update --no-cache add sshpass \
	&& apk --update --no-cache add lftp 
RUN mkdir /backup /certs /save ~/.lftp
RUN echo "set ssl:verify-certificate no" > ~/.lftp/rc	
COPY start.sh start.sh
COPY backup.sh backup.sh
RUN chmod +x start.sh
RUN chmod +x backup.sh
CMD ["/bin/sh", "start.sh"]