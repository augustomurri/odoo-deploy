FROM postgres:10

USER root

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y build-essential && \
    apt-get install -y software-properties-common && \
    apt-get install -y curl cron

COPY ./backups/backup.sh /BACKUP/backup.sh:x
RUN true
COPY ./backups/crontab /etc/cron.d/backup-cron
RUN chmod 0600 /etc/cron.d/backup-cron && \
    crontab /etc/cron.d/backup-cron && \
    touch /var/log/cron.log

RUN service cron start

CMD ["postgres"]
