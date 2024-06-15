`k0sctl init --k0s --cluster-name homelab-cluster-01 --controller-count 3 --user danesh danesh@k0sc01 danesh@k0sc02 danesh@k0sc03 danesh@k0sw01 danesh@k0sw02 k0sw03 > k0sctl.yaml`

`k0sctl apply --config k0sctl.yaml`

`k0sctl kubeconfig > cluster01.config`

`k9s --kubeconfig cluster01.config`
