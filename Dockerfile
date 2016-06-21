FROM kibana:latest

RUN apt-get update && apt-get install -y netcat

COPY entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

RUN kibana plugin --install elastic/sense

# https://github.com/docker-library/kibana/issues/20
RUN chmod o+w /opt/kibana/optimize/.babelcache.json

CMD ["/tmp/entrypoint.sh"]
