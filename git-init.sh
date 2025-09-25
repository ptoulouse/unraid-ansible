#!/bin/bash
# Sets up a pre-commit hook to ensure that vault.yaml is encrypted
#

if [ -d .git/ ]; then
rm .git/hooks/pre-commit
cat <<EOT >> .git/hooks/pre-commit
if ( git show :group_vars/all/vault.yml | grep -q "\$ANSIBLE_VAULT;" ); then
echo "[38;5;108mVault Encrypted. Safe to commit.[0m"
else
echo "[38;5;208mVault not encrypted! Run 'make encrypt' and try again.[0m"
exit 1
fi
EOT

fi

chmod +x .git/hooks/pre-commit
