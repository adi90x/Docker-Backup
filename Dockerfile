FROM gliderlabs/alpine
MAINTAINER Adrien Maurel <amaurel90@gmail.com>
RUN apk --update --no-cache update \
	&& apk --update --no-cache add openssh-client \
	&& apk --update --no-cache add nano \
	&& apk --update --no-cache add sshpass
RUN mkdir /backup /certs	
COPY cron_params /var/spool/cron/crontabs/root
COPY start.sh start.sh	
RUN chmod +x start.sh
CMD /bin/sh
#CMD crond -l 2 -f

#docker run -t -i -e PASS=060190 -v "C:\Users\AdrienM\Documents\Docker\:/backup"  -e DISTANT_HOST_PATH=adrienm@wheretogo.fr:~/backup/ --name scp-backup adi90x/scp-backup