export PATH := $(PWD)/venv/bin:$(PATH)

setup:
	python3 -m venv venv
	pip3 install -r pip_requirements.txt
	ansible-galaxy install -r galaxy_requirements.yml

gitinit:
	cp git_hooks/pre-commit .git/hooks/pre-commit
	chmod +x .git/hooks/pre-commit
	@echo "ansible vault pre-commit hook installed"
	@echo "don't forget to create a .vaultpass file"

lint:
	ansible-lint -p
	ansible-playbook playbook.yml --syntax-check

deploy:
	ansible-playbook playbook.yml -u root

decrypt:
	ansible-vault decrypt group_vars/all/vault.yml

encrypt:
	ansible-vault encrypt group_vars/all/vault.yml
