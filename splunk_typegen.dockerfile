FROM splunk/splunk:7.3.4

ENV SPLUNK_START_ARGS=--accept-license
ENV SPLUNK_LICENSE_URI=Free
ENV SPLUNK_PASSWORD=1234Abc@
ENV SPLUNK_ROLE=splunk_standalone
ENV SPLUNK_HOME=/opt/splunk
ENV SPLUNK_IGNORE_LICENSE=true
ENV SPLUNK_DEFAULTS_HTTP_MAX_TIMEOUT=50
ENV SPLUNK_DEFAULTS_HTTP_MAX_RETRIES=3
ENV SPLUNK_DEFAULTS_HTTP_MAX_DELAY=10

COPY conf_files/user-prefs.conf /opt/splunk/etc/users/admin/user-prefs/local/
COPY conf_files/web.conf /opt/splunk/etc/system/local/
ADD app/splunk_typegen.tgz /opt/splunk/etcs/apps/
EXPOSE 8000