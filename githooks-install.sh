#!/usr/bin/env bash

checkIfPreCommitExists() {
	if file .git/hooks/pre-commit &> /dev/null; then
		echo "WARNING! .git/hooks/pre-commit file alerady exists!"
		read -p "Override?? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
		
		curl -s https://raw.githubusercontent.com/suhovius/gitleaks-tools/main/githooks/pre-commit > .git/hooks/pre-commit
		chmod +x .git/hooks/pre-commit
	else
	fi
}

ensureGitleaksInstalled() {
  # Check if gitleaks is installed
  if ! type "gitleaks" > /dev/null; then
    echo "gitleaks not found. Installing gitleaks..."
    curl -s https://raw.githubusercontent.com/suhovius/gitleaks-tools/main/install.sh | bash

    if ! type "gitleaks" > /dev/null; then
      echo "Failed to install gitleaks. Aborting commit."
      exit 1
    fi
  fi  
}

checkIfPreCommitExists
ensureGitleaksInstalled