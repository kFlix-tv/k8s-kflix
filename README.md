## Info
1. Go Task Runner being used
2. All tasks should be done using that


### References:
- https://github.com/onedr0p/home-ops
- https://github.com/onedr0p/flux-cluster-template
- https://artifacthub.io/packages/search?org=k8s-home-lab



## Steps:
### Terraform
  1. `task terraform:init`
  2. `task terraform:apply`

### Ansible
  1. `task ansible:init`
  2. `task ansible:server`
  3. `task ansible:prepare`
  4. `task ansible:install`


## Kubernetes Deploy Order
1. Flux (Previously ArgoCD)
2. external-secrets