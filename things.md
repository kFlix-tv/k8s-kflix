kubectl apply -f startup-secrets.yaml
helm upgrade --install -n argo-cd -f helm-charts/argo-cd/values.yaml argo-cd helm-charts/argo-cd

kubectl get secret $(kubectl get sa/admin-user -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}"




Longhorn.io
https://github.com/shapetheLOLa/kube-mediabox
