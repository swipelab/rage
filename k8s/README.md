# K8S Rage Infrastructure

## connect rage-cluster

```sh
gcloud container clusters get-credentials rage-cluster --zone europe-west2-a --project co-swipelab-rage
```

## create rage-cluster

Create cluster GCP  @ https://console.cloud.google.com/
Steps / Create: 
  * Create Cluster
  * Select ``Standard Cluster``
  * name : ``rage-cluster``
  * Zonal : ``europe-west2-a`` (London)
  * Release channel : ``stable``
  * Nodes : ``1``
  * Instance Type : ``n1-highcpu-2`` (NGINX Controller Minimum Specs :( )

Steps / Configure:
  * Select cluster ``rage-cluster``
  * Click ``Connect``
  * Copy the command line acccess to clipboard
    - ``gcloud container clusters get-credentials rage-cluster --zone europe-west2-a --project co-swipelab-rage``
  * Enter Cloud Shell
  * Setup ``Secrets``
  * Setup ``INGRESS``
  * Setup ``HTTPS``
  * Happy Deployment


### Setup ``Secrets``
```sh
# Postgres Password
kubectl create secret generic postgres-password --from-literal postgres-password=...
```

### Setup ``INGRESS`` - GKE @ https://github.com/kubernetes/ingress-nginx
```sh
#nginx-ingress
kubectl create clusterrolebinding cluster-admin-binding --clusterrole cluster-admin --user $(gcloud config get-value account)
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm install my-nginx stable/nginx-ingress --set rbac.create=true
```

### SETUP ``HTTPS``  @ https://github.com/jetstack/cert-manager
```sh
kubectl apply --validate=false -f https://raw.githubusercontent.com/jetstack/cert-manager/v0.13.1/deploy/manifests/00-crds.yaml
kubectl create namespace cert-manager
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm install cert-manager jetstack/cert-manager --namespace cert-manager --version v0.13.1
```

### Setup ``Helm`` @ https://github.com/helm/helm
```sh
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```

### Ingress - Docker 
```sh
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/mandatory.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/cloud-generic.yaml
#verify
kubectl get svc -n ingress-nginx
```

### Creating a secret
```sh
kubectl create secret <secret-type> <secret-name> --from-literal SECRET_KEY=SECRET_VALUE
```
* ``secret-name`` - name of secret used as reference in a pod config
* ``secret-type`` - generic, tls, docker-registry

### Types of Users
* ``User Accounts`` - Identifies a *person* administering our cluster
* ``Service Accounts`` - Identifies a *pod* administering a cluster
* ``Cluster Role Binding`` - Authorizes an account to do a certain set of action across the entire cluster
* ``Role Binding`` - Authorizes an account to do a certain set of acctions in a *single namespace*
