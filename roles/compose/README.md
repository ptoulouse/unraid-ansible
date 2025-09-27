# Ansible Role: compose

An Ansible role that deploys a docker-compose application, targeted at Unraid
Compose Manager.

## Role Variables

Available variables are listed below, along with default values (see
defaults/main.yml).

Compose stack name. Default is undefined. Must be defined. Used for the stack
data directory and for the Compose Manager *name* file.

```yaml
compose_stack_name: "app1"
```

Compose stack description. Default is undefined. Used the Compose Manager
*description* file.

```yaml
compose_stack_description: "My app1"
```

The path where the compose files are deployed, each under their own directory.

```yaml
compose_path: /boot/config/plugins/compose.manager/projects
```

Data directory for the compose stacks.

```yaml
compose_data_path: /mnt/user/appdata
```

Data subdirectories to create in the data directory. Subdir is required, owner,
group and mode are optional. Defaults are nobody, users and 0750.

```yaml
# Default
compose_data_subdirs: []

# Example
compose_data_subdirs:
  -subdir: my_stack
  - subdir: my_stack/db
    owner: nobody
    group: users
    mode: '0750'
  - subdir: my_stack/data
    owner: root
    group: root
    mode: '0700'
```

Configuration files to create in the data directory. File is required, owner,
group and mode are optional. Defaults are nobody, users and 0640.

```yaml
# Default
compose_config_files: []

# Example
compose_config_files:
  - src: my.cnf.j2
    dest: my_stack/db/my.cnf
    owner: nobody
    group: users
    mode: '0640'
  - src: my_stack/data/another.conf
    owner: root
    group: root
    mode: '0600'
```

Name of the compose template and destination file.

```yaml
compose_template: compose.yml.j2
compose_file: docker-compose.yml
```

Set to 'true' when using Unraid Compose Manager plugin. The following files
will be created along the compose file: name, description, autostart.

```yaml
compose_manager: true
```

Define if Unraid Compose Manager Auto Start is set to on or off.

```yaml
compose_manager_autostart: true
```

## Example

```yaml
# Role: app1
- name: Install app1
  ansible.include_role:
    name: compose
  vars:
    compose_stack_name: "app1"
    compose_stack_description: "My app1"
    compose_template: docker-compose.yml.j2
    compose_file: docker-compose.yml
```
