helm repo add jetstack https://charts.jetstack.io
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
helm repo update

hui external-dns -f helm-charts/external-dns/external-dns-values.yaml bitnami/external-dns
helm install nginx-ingress ingress-nginx/ingress-nginx
kubectl create namespace cert-manager
kubectl create secret --namespace=cert-manager generic cloudflare --from-literal=dns-token=vEUP3xL4cx7_AvWZEdAvAbG82XPwqnQCpzRH9ZUy
helm upgrade --install cert-manager jetstack/cert-manager --namespace cert-manager --version v1.7.1 --set installCRDs=true
helm upgrade --install k8s-dashboard -f helm-charts/k8s-dashboard/k8s-dashboard-values.yaml kubernetes-dashboard/kubernetes-dashboard
kubectl get secret $(kubectl get sa/admin-user -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}"
helm upgrade --install -f helm-charts/argo-cd/argo-cd-values.yaml argocd bitnami/argo-cd




Longhorn.io
https://github.com/shapetheLOLa/kube-mediabox
