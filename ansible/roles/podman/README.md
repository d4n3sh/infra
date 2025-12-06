# Podman Role

Ansible role to install and configure Podman container runtime on Ubuntu, Rocky Linux, and CentOS.

## Requirements

- Ansible 2.9 or higher
- Target system running one of the supported operating systems

## Supported Operating Systems

- Ubuntu 20.04 (Focal)
- Ubuntu 22.04 (Jammy)
- Ubuntu 24.04 (Noble)
- Rocky Linux 8, 9
- CentOS 7, 8, 9

## Role Variables

Available variables are listed below, along with default values (see `defaults/main.yml`):

```yaml
# Enable Podman socket for rootless containers
podman_enable_socket: false

# Podman package state (present, latest, absent)
podman_package_state: present

# Configure container registries (optional)
podman_registries:
  unqualified_search_registries:
    - docker.io
    - quay.io
  registries:
    - location: docker.io
      insecure: false
    - location: quay.io
      insecure: false
```

## Dependencies

None.

## Example Playbook

Basic installation:

```yaml
---
- hosts: servers
  become: yes
  roles:
    - podman
```

With custom configuration:

```yaml
---
- hosts: servers
  become: yes
  roles:
    - role: podman
      vars:
        podman_enable_socket: true
        podman_registries:
          unqualified_search_registries:
            - docker.io
            - quay.io
            - registry.internal.example.com
          registries:
            - location: docker.io
              insecure: false
            - location: registry.internal.example.com
              insecure: true
```

## Usage Examples

After installation, you can use Podman:

```bash
# Run a container
podman run -it ubuntu:latest /bin/bash

# List containers
podman ps -a

# List images
podman images

# Pull an image
podman pull nginx:latest
```

## License

MIT

## Author Information

Created by d4n3sh
