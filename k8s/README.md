### links
https://kubernetes.github.io/ingress-nginx/
https://kubernetes.github.io/ingress-nginx/deploy/

### rage-cluster

ingress-service > ghost-cluster
ghost-cluster > ghost-deployment > docker.io/swipelab/rage-ghost

### Creating a secret
kubectl create secret generic <secret_name> --from-literal SECRET_KEY=SECRET_VALUE

### Helm
```sh

#install
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm install my-nginx stable/nginx-ingress --set rbac.create=true

# outdated
# #tiller - Role Based Access Controll (RBAC)
# kubectl create serviceaccount --namespace kube-system tiller
# kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
# #init
# helm init --service-account tiller --upgrade
```


Types of Users
User Accounts - Identifies a *person* administering our cluster
Service Accounts - Identifies a *pod* administering a cluster
Cluster Role Binding - Authorizes an account to do a certain set of action across the entire cluster
Role Binding - Authorizes an account to do a certain set of acctions in a *single namespace*
