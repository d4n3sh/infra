`qm clone 9000 200 --name k03-c01 --full`

`qm clone 9000 201 --name k03-w01 --full`

`qm set 200 --ipconfig0 ip=192.168.100.110/24,gw=192.168.100.1 --nameserver 192.168.100.1 --searchdomain home.d4n3sh.com`

`qm set 201 --ipconfig0 ip=192.168.100.113/24,gw=192.168.100.1 --nameserver 192.168.100.1 --searchdomain home.d4n3sh.com`

`qm disk resize 200 scsi0 20G`

`qm disk resize 201 scsi0 100G`

`qm set 200 --cores 2 --memory 2048 --sockets 1`

`qm set 201 --cores 2 --memory 2048 --sockets 1`

`qm destroy 200`

`qm destroy 201`

`qm start 200`

`qm start 201`

`ansible-playbook -i ansible/inventory ansible/playbook.yaml`

`k0sctl init --k0s --cluster-name k0s-cluster01 --controller-count 1 --user danesh k0sc01 k0sw01  > k0sctl.yaml`

`k0sctl apply --config k0s/k0sctl.yaml --dry-run`

`k0sctl apply --config k0s/k0sctl.yaml`

`k0sctl kubeconfig --config k0s/k0sctl.yaml > k0s-cluster01.kubeconfig`

`kubectl --kubeconfig k0s-cluster01.kubeconfig get nodes --show-labels`

```bash
❯ kubectl --kubeconfig k0s-cluster01.kubeconfig get nodes --show-labels
NAME      STATUS   ROLES           AGE     VERSION       LABELS
k03-c01   Ready    control-plane   3m42s   v1.30.1+k0s   beta.kubernetes.io/arch=amd64,beta.kubernetes.io/os=linux,kubernetes.io/arch=amd64,kubernetes.io/hostname=k03-c01,kubernetes.io/os=linux,node-role.kubernetes.io/control-plane=true,node.k0sproject.io/role=control-plane
k03-w01   Ready    <none>          3m36s   v1.30.1+k0s   beta.kubernetes.io/arch=amd64,beta.kubernetes.io/os=linux,kubernetes.io/arch=amd64,kubernetes.io/hostname=k03-w01,kubernetes.io/os=linux
```
`k9s --kubeconfig k0s-cluster01.kubeconfig`

![k9s](images/k9s.png)