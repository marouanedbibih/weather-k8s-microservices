bash mysql/secert.sh

# Deploy MySQL
kubectl apply -f mysql/headless-service.yaml
kubectl apply -f mysql/statefulset.yaml
kubectl apply -f mysql/init-job.yaml

# Deploy Auth Service
kubectl apply -f auth/deployment.yaml
kubectl apply -f auth/service.yaml

# Deploy Weather Service
bash weather/secret.sh
kubectl apply -f weather/deployment.yaml
kubectl apply -f weather/service.yaml

# Deploy Frontend
bash frontend/certificate.sh
kubectl apply -f frontend/deployment.yaml
kubectl apply -f frontend/service.yaml
kubectl apply -f frontend/ingress.yaml
