# Ansible Role: docker_networks

An Ansible role that deploys a Docker networks.

## Role Variables

Available variables are listed below, along with default values
(see defaults/main.yml).

```yaml
docker_networks_list: []
```

List of Docker networks to deploy.

## Example

```yaml
- hosts: myserver
  roles:
    - role: docker_networks
      vars:
        docker_networks_list:
          - my-network
          - another-network
```
