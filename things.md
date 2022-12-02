k3sup install --ip ${K8S_IP} --user root --k3s-extra-args '--no-deploy traefik' --local-path $HOME/.kube/config-files/kflix.yaml --context kflix --ssh-key $HOME/.ssh/id_ecdsa

export GITHUB_PASSWORD="op://2fa/github/Argo"
export AKEYLESS_ACCESSID="op://Personal/Akeyless/accessID"
export AKEYLESS_ACCESSTYPEPARAM="op://Personal/Akeyless/AccessTypeParam"

op run --no-masking -- envsubst < startup-secrets.yaml | kubectl apply -f -

helm dependency build helm-charts/argo-cd && helm upgrade --install -n argo-cd -f helm-charts/argo-cd/values.yaml argo-cd helm-charts/argo-cd

helm upgrade --install -n argo-cd -f helm-charts/cluster-bootstrap/values.yaml argo-bootstrap helm-charts/cluster-bootstrap












kubectl get secret $(kubectl get -n kubernetes-dashboard sa/admin-user -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}"




Longhorn.io
https://github.com/shapetheLOLa/kube-mediabox
