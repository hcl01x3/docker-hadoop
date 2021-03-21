FROM octo5/hadoop-base:3.3.0

MAINTAINER octo5 <hyochan.lee@gmail.com>

HEALTHCHECK CMD curl -f http://localhost:9864/ || exit 1

EXPOSE 9864

ADD entrypoint.sh ./entrypoint.sh
RUN chmod 0755 ./entrypoint.sh

ENTRYPOINT "./entrypoint.sh"

CMD ["hadoop-dn"]
