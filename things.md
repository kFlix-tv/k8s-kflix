k3sup install --ip 147.182.234.13 --user root --k3s-extra-args '--no-deploy traefik' --local-path $HOME/.kube/config-files --context kflix --ssh-key $HOME/.ssh/id_ecdsa

export GITHUB_PASSWORD='<pass>'
export AKEYLESS_ACCESSID='<accessId>'
export AKEYLESS_ACCESSTYPEPARAM='<pass>'

envsubst < startup-secrets.yaml | kubectl apply -f -

helm dependency build helm-charts/argo-cd && helm upgrade --install -n argo-cd -f helm-charts/argo-cd/values.yaml argo-cd helm-charts/argo-cd














kubectl get secret $(kubectl get -n kubernetes-dashboard sa/admin-user -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}"




Longhorn.io
https://github.com/shapetheLOLa/kube-mediabox
