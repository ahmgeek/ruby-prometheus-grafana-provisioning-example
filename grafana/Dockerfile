FROM grafana/grafana:5.4.3

COPY ./provisioning/dashboards/*.yml /etc/grafana/provisioning/dashboards/
COPY ./provisioning/datasources/*.yml  /etc/grafana/provisioning/datasources/
COPY ./dashboards/docker.json /var/lib/grafana/dashboards/
