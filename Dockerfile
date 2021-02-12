FROM splunk/splunk:7.3.4

COPY conf_files/user-prefs.conf /opt/splunk/etc/users/admin/user-prefs/local/
COPY conf_files/web.conf /opt/splunk/etc/system/local/
ADD app/splunk_typegen_v1.tgz /opt/splunk/etc/apps/