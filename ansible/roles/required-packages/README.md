# Required Packages Role

Installs essential required system packages across different Linux distributions, including qemu-guest-agent for VM environments.

## Features

- Automatically detects QEMU/KVM VMs and installs qemu-guest-agent only when needed
- Installs OS-specific required packages (ca-certificates, curl, gnupg, etc.)
- Supports Ubuntu, Debian, Rocky Linux, and RHEL
- Configurable package lists via variables
- Enables and starts qemu-guest-agent service on QEMU/KVM VMs

## Variables

### `required_packages_common`
Default: `['qemu-guest-agent']`

Common packages installed on all systems.

### `required_packages_extra`
Default: `[]`

Additional packages to install. Can be set per host or group in inventory.

### `required_packages_state`
Default: `present`

Package state (present, latest, absent).

### `required_packages_os_specific`
Automatically loaded from vars/ based on OS distribution. Contains OS-specific packages.

## Example Usage

### Basic usage in playbook:

```yaml
- name: Install required packages
  hosts: all
  become: true
  roles:
    - required-packages
```

### With extra packages:

```yaml
- name: Install required packages with extras
  hosts: all
  become: true
  roles:
    - role: required-packages
      vars:
        required_packages_extra:
          - vim
          - htop
          - net-tools
```

### In inventory (group_vars or host_vars):

```yaml
required_packages_extra:
  - vim
  - htop
  - git
  - tmux
```

## Requirements

- Ansible 2.9 or higher
- sudo/root privileges on target hosts

## License

MIT
