# Redis Helm Config
## Add repo
helm repo add bitnami https://charts.bitnami.com/bitnami

## Setup redis for price cache
```bash
kubectl create ns redis
```
## Data Direcotory Creation & Permission
mkdir /mnt/redis-cluster-master-0
mkdir /mnt/redis-cluster-slave-0/
mkdir /mnt/redis-cluster-slave-1/
mkdir /mnt/redis-cluster-slave-2/
chown -R 1001:1001 /mnt/redis-cluster-master-0
chown -R 1001:1001 /mnt/redis-cluster-slave-0/
chown -R 1001:1001 /mnt/redis-cluster-slave-1
chown -R 1001:1001 /mnt/redis-cluster-slave-2

## PV Creation
```
kubectl apply -f redis-pv.yaml

```
```bash
helm install redis -f values-prd.yaml bitnami/redis -n redis
```

## Setup redis for logs stream
```bash
kubectl create ns logs-redis
```
```bash
helm install logs-redis -f values.yaml bitnami/redis -n redis
```

