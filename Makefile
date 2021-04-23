
# docker
up:
	docker-compose -f docker-compose.yaml up

# kustomize
watch:
	watch -t "kubectl get pod,service,deploy,ingress --all-namespaces"


kustomize_apply:
	kustomize build ./k8s/guestbook/base | kubectl apply -f - && \
	kustomize build ./k8s/redis-master/base | kubectl apply -f - && \
	kustomize build ./k8s/redis-slave/base | kubectl apply -f - && \
	# kubectl create namespace argocd && \
	# kubectl apply -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kustomize_delete:
	kustomize build ./k8s/guestbook/base | kubectl delete -f - && \
	kustomize build ./k8s/guestbook/base | kubectl delete -f - && \
	kustomize build ./k8s/redis-master/base | kubectl delete -f - && \
	kustomize build ./k8s/redis-slave/base | kubectl delete -f - && \
	kubectl delete namespace argocd && \
	kubectl delete namespace istio-system

# istio
kiali:
	istioctl dashboard kiali

exec_example:
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/examples/master/guestbook-go/redis-master-controller.json && \
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/examples/master/guestbook-go/redis-master-service.json && \
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/examples/master/guestbook-go/redis-slave-controller.json && \
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/examples/master/guestbook-go/redis-slave-service.json && \
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/examples/master/guestbook-go/guestbook-controller.json && \
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/examples/master/guestbook-go/guestbook-service.json

create_eks:
	eksctl create cluster \
		--name eks-from-eksctl \
		--version 1.16 \
		--region ap-northeast-1 \
		--nodegroup-name workers \
		--node-type t3.medium \
		--nodes 1 \
		--nodes-min 1 \
		--nodes-max 2 \
		--ssh-access \
		--ssh-public-key ~/.ssh/eks-demo.pem.pub \
		--managed

delete_eks:
	eksctl delete cluster --name eks-from-eksctl --region ap-northeast-1

argocd:
	kubectl port-forward svc/argocd-server -n argocd 8080:443

argocd_pass:
	kubectl get pods -l app.kubernetes.io/name=argocd-server -o name | cut -d'/' -f 2
