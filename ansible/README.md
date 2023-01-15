# Home infra playbooks

Run this first to make sure all dependencies are installed.
`ansible-galaxy install -r requirements.yml`

Playbook to set up work laptop.
`ansible-playbook local-work-mac.yml`

Playbook to set up personal mac.
`ansible-playbook local-personal-mac.yml`

Playbook to set up docker server koala.
`ansible-playbook koala.yml -K`
