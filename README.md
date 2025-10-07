/* Commands */

docker build -t myapp:v1
docker push myapp:v1

kubectl apply -f deployment.yml


kubectl apply -f service.yml


kubectl apply -f configmap.yml


kubectl apply -f hpa.yml


ConfigMap:
key value pair : code might need some values to be passed , which are not sensitive.

deployment : configmap and set them in env

Secrets:
storing sensitive information. code needs secrets , env


