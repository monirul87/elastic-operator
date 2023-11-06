# Redis Helm Config
## Add repo
helm repo add bitnami https://charts.bitnami.com/bitnami

## Setup redis for price cache
```bash
kubectl create ns redis
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

