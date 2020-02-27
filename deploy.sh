docker build -t swipelab/rage-ghost:latest -t swipelab/rage-ghost:$SHA -f ./ghost/Dockerfile ./ghost

docker push swipelab/rage-ghost:latest
docker push swipelab/rage-ghost:$SHA

kubectl apply -f k8s
kubectl apply -f k8s/https

kubectl set image deployments/ghost-deployment ghost=swipelab/rage-ghost:$SHA