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

vaults := $(wildcard group_vars/*/vault.yml host_vars/*/vault.yml)

decrypt:
	@for file in $(vaults); do \
		if [ -f "$$file" ]; then \
			ansible-vault decrypt "$$file"; \
		else \
			echo "File $$file does not exist."; \
		fi \
	done

encrypt:
	@for file in $(vaults); do \
	    echo "Processing $$file"; \
		if [ -f "$$file" ]; then \
			ansible-vault encrypt "$$file"; \
		else \
			echo "File $$file does not exist."; \
		fi \
	done
