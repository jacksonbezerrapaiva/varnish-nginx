# Create configuration

Poc from Varnish

# Itens tests
- Directory shared-cache (POC cache multi pods)
- Directory varnish (POC varnish)
- Directory varnish-volume (POC varnish from volume PV)


## Configure hosts:
- Add in File /etc/hosts

```sh
192.168.49.2	shared-cache-poc.com
192.168.49.2	varnish-poc.com
192.168.49.2	varnish-volume-poc.com
```

## Execute files create namespace 

```sh
chmod 777 shared-cache/k8s-create.sh shared-cache/k8s-delete.sh
chmod 777 varnish/k8s-create.sh varnish/k8s-delete.sh
chmod 777 varnish-volume/k8s-create.sh varnish-volume/k8s-delete.sh
bash -i shared-cache/k8s-create.sh
bash -i varnish/k8s-create.sh
bash -i varnish-volume/k8s-create.sh
```

## Execute start project minikube

```sh
bash -i minikube.sh
```

## Delete cluster

```sh
bash -i shared-cache/k8s-delete.sh
bash -i varnish/k8s-delete.sh
bash -i varnish-volume/k8s-delete.sh
```


## Generate imagem docker Hub
```sh
docker build -t varnish-alpine .
docker images
docker run --name fc3610eb141e -p 8099:80 varnish-ubuntu
docker container logs fc3610eb141e

docker tag varnish-ubuntu jacksonbezerrapaiva/varnish-ubuntu
docker login
docker push jacksonbezerrapaiva/varnish-ubuntu
```


## Command start varnish
```sh
sudo /usr/local/sbin/varnishd -f /home/jackson/repositories/varnish-nginx/varnish-volume/default.vcl -a http=:5555,HTTP -sdeprecated_persistent,/home/jackson/varnish/logs/test,1G -S /home/jackson/repositories/varnish-nginx/secret  -T localhost:6082 -n /home/jackson/varnish
```
