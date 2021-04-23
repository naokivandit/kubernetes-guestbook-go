## Description
[kubernetesの公式サンプルguestbook-go](https://github.com/kubernetes/examples/tree/master/guestbook-go)でkubernetes構築

- マニフェストファイルはKustomizeで管理
- EKSで動くようにTerrafom化

## Services
- argocd
- guestbook
- redis-master
- redis-slave

## Infrastructure as Code
Kustomize, Terraform
