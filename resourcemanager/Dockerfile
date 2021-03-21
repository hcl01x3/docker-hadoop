FROM octo5/hadoop-base:3.3.0

MAINTAINER octo-5 <hyochan.lee@gmail.com>

HEALTHCHECK CMD curl -f http://localhost:8088/ || exit 1

EXPOSE 8088

ADD entrypoint.sh ./entrypoint.sh
RUN chmod 0755 ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]

CMD ["hadoop-rm"]
