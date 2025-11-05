# NTP Client Role

Configures systemd-timesyncd to synchronize time with NTP servers.

## Features

- Configures systemd-timesyncd NTP client
- Uses drop-in configuration file in `/etc/systemd/timesyncd.conf.d/`
- Points to local NTP server by default (192.168.100.3)
- Configurable poll intervals and timeouts
- Verifies time synchronization after configuration
- Supports Ubuntu, Debian, Rocky Linux, and RHEL

## Variables

### `ntp_client_servers`
Default: `['192.168.100.3']`

Primary NTP server(s) to synchronize with. Can specify multiple servers as a list.

### `ntp_client_fallback_servers`
Default: `[]`

Fallback NTP servers to use if primary servers are unavailable. Empty by default to rely solely on local NTP server.

Example:
```yaml
ntp_client_fallback_servers:
  - ntp.ubuntu.com
  - time.cloudflare.com
```

### `ntp_client_root_distance_max_sec`
Default: `5`

Maximum acceptable root distance in seconds.

### `ntp_client_poll_interval_min_sec`
Default: `32`

Minimum polling interval in seconds.

### `ntp_client_poll_interval_max_sec`
Default: `2048`

Maximum polling interval in seconds.

### `ntp_client_connection_retry_sec`
Default: `30`

Retry interval for failed connections in seconds.

### `ntp_client_save_interval_sec`
Default: `60`

Interval for saving time synchronization state in seconds.

## Example Usage

### Basic usage in playbook:

```yaml
- name: Configure NTP client
  hosts: all
  become: true
  roles:
    - ntp-client
```

### With custom NTP servers:

```yaml
- name: Configure NTP client
  hosts: all
  become: true
  roles:
    - role: ntp-client
      vars:
        ntp_client_servers:
          - 192.168.100.3
          - 192.168.100.4
        ntp_client_fallback_servers:
          - ntp.ubuntu.com
```

### In inventory (group_vars or host_vars):

```yaml
# group_vars/all.yml
ntp_client_servers:
  - 192.168.100.3

# Disable fallback to use only local NTP server
ntp_client_fallback_servers: []
```

## Verification

After running the role, verify time synchronization:

```bash
# Check timesync status
timedatectl timesync-status

# Check overall time status
timedatectl status

# View systemd-timesyncd service status
systemctl status systemd-timesyncd
```

Expected output from `timedatectl timesync-status`:
```
       Server: 192.168.100.3 (192.168.100.3)
Poll interval: 2min 8s (min: 32s; max 34min 8s)
         Leap: normal
      Version: 4
      Stratum: 3
```

## Configuration File Location

The role creates a drop-in configuration file at:
```
/etc/systemd/timesyncd.conf.d/timesyncd.conf
```

This approach is recommended over modifying `/etc/systemd/timesyncd.conf` directly.

## Requirements

- Ansible 2.9 or higher
- sudo/root privileges on target hosts
- systemd-based systems
- systemd-timesyncd package

## Notes

- This role configures systemd-timesyncd, which is the default NTP client on systemd-based systems
- If you're running an NTP server (like chrony), you should exclude it from the ntp-client group
- The role waits 3 seconds after restarting the service to allow time synchronization to establish

## License

MIT
