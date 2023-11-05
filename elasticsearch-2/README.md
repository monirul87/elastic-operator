1. Add bitnami repository.
```
$ helm repo add bitnami https://charts.bitnami.com/bitnami
```

2. Create SSD to be used as data storage.
```
$ kubectl apply -f ssd-storageclass.yaml
```

3. Install Elasticsearch with the values defined in values.yaml.
```
$ helm upgrade --install elasticsearch . --namespace elasticsearch --values values-PRD.yaml
```
