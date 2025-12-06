# Timezone Role

Configures system timezone across different Linux distributions.

## Features

- Sets system timezone using timedatectl
- Verifies timezone configuration
- Restarts cron service when timezone changes
- Supports Ubuntu, Debian, Rocky Linux, and RHEL
- Default timezone: America/Chicago

## Variables

### `system_timezone`
Default: `America/Chicago`

The timezone to set on the system. Must be a valid timezone from the tz database.

Common timezones:
- `America/Chicago` (Central Time)
- `America/New_York` (Eastern Time)
- `America/Denver` (Mountain Time)
- `America/Los_Angeles` (Pacific Time)
- `UTC`

To see all available timezones:
```bash
timedatectl list-timezones
```

## Example Usage

### Basic usage in playbook:

```yaml
- name: Configure system timezone
  hosts: all
  become: true
  roles:
    - timezone
```

### With custom timezone:

```yaml
- name: Configure system timezone
  hosts: all
  become: true
  roles:
    - role: timezone
      vars:
        system_timezone: America/New_York
```

### In inventory (group_vars or host_vars):

```yaml
# group_vars/all.yml
system_timezone: America/Chicago

# host_vars/server-in-california.yml
system_timezone: America/Los_Angeles
```

## Verification

After running the role, verify the timezone is set correctly:

```bash
timedatectl
# or
timedatectl show --property=Timezone --value
```

## Requirements

- Ansible 2.9 or higher
- sudo/root privileges on target hosts
- systemd-based systems

## License

MIT
