### links
https://kubernetes.github.io/ingress-nginx/
https://kubernetes.github.io/ingress-nginx/deploy/

### rage-cluster

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




Types of Users
User Accounts - Identifies a *person* administering our cluster
Service Accounts - Identifies a *pod* administering a cluster
Cluster Role Binding - Authorizes an account to do a certain set of action across the entire cluster
Role Binding - Authorizes an account to do a certain set of acctions in a *single namespace*
