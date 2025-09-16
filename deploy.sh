set -e

NAME="kubernetes-demo-api"
USERNAME="hengkakada"
IMAGE="$USERNAME/$NAME:latest"

echo "Build docker image ..."
docker build . -t $IMAGE

echo "Pushing image to docker hub ..."
docker push $IMAGE

echo "Applying kubernetes manifests ..."
kubectl apply -f k8s/

echo "Getting pods ..."
kubectl get pods

echo "Getting services ..."
kubectl get services

echo "Fetch the main service"
kubectl get services $NAME-service