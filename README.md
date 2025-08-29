/* Commands */

docker build -t myapp:v1
docker push myapp:v1

kubectl apply -f deployment.yml


kubectl apply -f service.yml


kubectl apply -f configmap.yml


kubectl apply -f hpa.yml

