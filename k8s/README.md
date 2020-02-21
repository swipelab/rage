### links
https://kubernetes.github.io/ingress-nginx/
https://kubernetes.github.io/ingress-nginx/deploy/

### rage-cluster

Create cluster GCP
* Open console.cloud.google.com
  - Standard Cluster
  - name : rage-cluster
  - Zonal : europe-west2-a (London)
  - Release channel : stable
  - Nodes : 1
  - Instance Type : n1-highcpu-2 (NGINX Controller Minimum Specs :( )
  

ingress-service > ghost-cluster
ghost-cluster > ghost-deployment > docker.io/swipelab/rage-ghost

### Creating a secret
kubectl create secret generic <secret_name> --from-literal SECRET_KEY=SECRET_VALUE

### CLI

```sh
gcloud container clusters get-credentials rage-cluster --zone europe-west2-a --project co-swipelab-rage
```

### Helm
```sh

#install
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```

### NGINX
```sh
kubectl create clusterrolebinding cluster-admin-binding --clusterrole cluster-admin --user $(gcloud config get-value account)

helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm install my-nginx stable/nginx-ingress --set rbac.create=true
```

### HTTPS
github.com/jetstack/cert-manager
```sh
kubectl apply --validate=false -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.13/deploy/manifests/00-crds.yaml
kubectl create namespace cert-manager
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm install cert-manager --namespace cert-manager --version v0.13.0 jetstack/cert-manager

# kubectl create namespace cert-manager
# kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v0.13.1/cert-manager.yaml
# kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user=$(gcloud config get-value core/account)
# helm repo add jetstack https://charts.jetstack.io
# helm repo update
# helm install cert-manager --namespace cert-manager --version v0.13.1 jetstack/cert-manager
```


Types of Users
  - User Accounts - Identifies a *person* administering our cluster
  - Service Accounts - Identifies a *pod* administering a cluster
  - Cluster Role Binding - Authorizes an account to do a certain set of action across the entire cluster
  - Role Binding - Authorizes an account to do a certain set of acctions in a *single namespace*
