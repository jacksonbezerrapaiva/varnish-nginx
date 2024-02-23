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
docker run --name <name-container> -p 8080:80 <new_image_name>
docker tag varnish-alpine jacksonbezerrapaiva/varnish-alpine
docker login
docker push jacksonbezerrapaiva/varnish-alpine
```