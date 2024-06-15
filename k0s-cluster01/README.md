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