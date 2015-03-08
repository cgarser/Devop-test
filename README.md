# Devop-test
requesthttp-proxy.py script requires requests lib. http://docs.python-requests.org/en/latest/


Usage 

Build the docker app:

$docker build -t docker-name /path/to/dockerfile

Run the docker:

$docker run -p 80:80 docker-name

Run the the script

$python requesthttp-proxy.py

OutPut
[root@localhost Descargas]# python requesthttp-proxy.py
-Datencenter: VirginiaDC01
    -Servers:	
        - Spock01 : Web server
        - Andromeda02 : Mesos cluster
        - Andromeda01 : Mesos cluster
        - Galaxy02 : Docker server
        - Docker01 : Docker server
-Datencenter: CaliforniaDC01
    -Servers:	
        - Andromeda02 : Mesos cluster
        - BigData02 : BigData for real
        - ElasticSearch01 : Elastic Search server
        - LoadBalancer02 : Haproxy server
-Datencenter: OregonDC02
    -Servers:	
        - NotNewestServer04 : Gopher server
        - FTP02 : FTP for clients
        - Ping02 : Monitoring
        - the server with id 20 does not exist on OregonDC02
