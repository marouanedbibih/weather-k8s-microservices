bash mysql/secert.sh

# Deploy MySQL
kubectl apply -f mysql/headless-service.yaml
kubectl apply -f mysql/statefulset.yaml
kubectl apply -f mysql/init-job.yaml

# Deploy Auth Service
kubectl apply -f auth/deployment.yaml
kubectl apply -f auth/service.yaml

curl -X POST http://weatherapp-auth:8080/users -H "Content-Type: application/json" -d '{"username": "marouane", "password": "password"}'