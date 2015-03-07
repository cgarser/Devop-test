import json, requests
#user = raw_input("Please enter de user to access - ""admin"": ")
#password = raw_input("Please enter password to acces - ""admin"": ")
#urlhash = "http://" + str(user) + ":" + str(password) + "@localhost/datacenter/"
dc_url = requests.get('http://admin:admin@localhost/datacenters/')
dc_binary = dc_url.content
dc_output = json.loads(dc_binary)

for id, dc in enumerate(dc_output):
    print "-Datencenter: " + dc['name']
    serv = str(dc['servers'])
    str_serv = serv.rsplit(",")
    print "    -Servers:\t"
    try:
        for sv_num in str_serv:
            sv_url = 'http://admin:admin@localhost/servers/' + sv_num + '.json'
            sv_data = requests.get(sv_url)
            sv_binary = sv_data.content
            sv_output = json.loads(sv_binary)
            print "        - " + sv_output['name'] + " : " + sv_output['description']
    except KeyError:
        print "        - " + sv_output['message'] + " on " + dc['name']
