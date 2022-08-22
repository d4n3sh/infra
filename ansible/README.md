# Home infra playbooks

Run this first to make sure all dependencies are installed.
`ansible-galaxy collection install -r requirements.yml`

Playbook to setup work laptop
`ansible-playbook local-work-mac.yml`

Playbook to setup personal mac
`ansible-playbook local-personal-mac.yml`
