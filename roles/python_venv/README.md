# Ansible Role: python_venv

An Ansible role that creates a Python virtual environment and install Python
packages in it.

## Role Variables

Available variables are listed below, along with default values
(see defaults/main.yml).

Path where the virtual environment will be created.

```yaml
python_venv_path: "/mnt/user/appdata/venv"
```

User and group ownership, and mode for the virtual environment.

```yaml
python_venv_owner: "{{ ansible_user }}"
python_venv_group: "{{ ansible_user }}"
python_venv_mode: "0755"
```

Version of pip to install.

```yaml
python_venv_pip_version: "latest"
```

List of Python packages to install in the virtual environment. Can be simple
package names or dictionaries with name, version, state.

```yaml
# Default
python_venv_packages: []

# Example 1:
python_venv_packages:
  - "flask"
  - "gunicorn"
  - "pytest"

# Example 2:
python_venv_packages:
  - name: "django"
    version: "4.2.0"
  - name: "requests"
  - "pandas"
  - name: "numpy"
    state: "latest"
```

Path to a requirements file. Alternatively, packages may be listed in this
requirements file.

```yaml
# Default
python_venv_requirements_file: ""

# Example:
python_venv_requirements_file: "/path/to/requirements.txt"
```

## Example

```yaml
- hosts: myserver
  roles:
    - role: python_venv
      vars:
        python_venv_packages:
          - requests
          - flask
```
