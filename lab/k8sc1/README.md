# k0s cluster: k8sc1

## ArgoCD
`kustomize build argocd/lab | kubectl apply -f -`

Get the default admin password using the argocd cli.
`argocd admin initial-password -n argocd`

Setup port forwarding and access the webUI at `https://127.0.0.1:8080/`
`kubectl port-forward svc/argocd-server -n argocd 8080:443`