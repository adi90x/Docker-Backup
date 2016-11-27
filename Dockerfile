FROM gliderlabs/alpine
MAINTAINER Adrien Maurel <amaurel90@gmail.com>
RUN apk --update --no-cache update \
	&& apk --update --no-cache add openssh-client \
	&& apk --update --no-cache add sshpass \
	&& apk --update --no-cache add lftp \
	&& apk --update --no-cache add nano
RUN mkdir /backup /certs /save ~/.lftp
RUN echo "set ssl:verify-certificate no" > ~/.lftp/rc	
COPY cron_params /var/spool/cron/crontabs/root
COPY start.sh start.sh	
RUN chmod +x start.sh
CMD crond -l 2 -f