# Dockerfile that use httpd as a reverse proxy for access to 3scale apis
FROM centos:latest

RUN yum -y update
RUN yum -y install httpd
RUN mkdir /etc/httpd/passwd/
RUN htpasswd -c -b /etc/httpd/passwd/password admin admin
RUN sed -i 's/^#ServerName.*/ServerName 127.0.0.1:80/g' /etc/httpd/conf/httpd.conf
RUN echo "ProxyPass  /datacenters/  http://datacenters-api.va.3sca.net/datacenters/" >> /etc/httpd/conf/httpd.conf
RUN echo "ProxyPass  /datacenters  http://datacenters-api.va.3sca.net/datacenters/" >> /etc/httpd/conf/httpd.conf
RUN echo "ProxyPass  /servers/  http://servers-api.va.3sca.net/servers/" >> /etc/httpd/conf/httpd.conf
RUN echo "ProxyPass  /servers  http://servers-api.va.3sca.net/servers/" >> /etc/httpd/conf/httpd.conf

RUN echo -e "LoadModule cache_module modules/mod_cache.so\n<IfModule mod_cache.c>\n    LoadModule cache_disk_module modules/mod_cache_disk.so\n    <IfModule mod_cache_disk.c>\n        CacheRoot c:/cacheroot\n        CacheEnable disk  /\n        CacheDirLevels 5\n        CacheDirLength 3\n    </IfModule>\n</IfModule>\n" >> /etc/httpd/conf/httpd.conf
RUN echo -e "<Location /*>\nAuthType Basic\nAuthUserFile "/etc/httpd/passwd/password"\nAuthName Limited!\nrequire valid-user\n</Location>\n" >> /etc/httpd/conf/httpd.conf
EXPOSE 80

ENTRYPOINT /usr/sbin/httpd -DFOREGROUND
