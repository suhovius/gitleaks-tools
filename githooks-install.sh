#!/usr/bin/env bash

checkIfPreCommitExists() {
	if [ -f .git/hooks/pre-commit ]; then
		echo "WARNING! .git/hooks/pre-commit file alerady exists!"
		read -p "Override?? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1

		downloadAndInstallPreCommitGitHook
	else
		downloadAndInstallPreCommitGitHook
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

downloadAndInstallPreCommitGitHook() {
	curl -s https://raw.githubusercontent.com/suhovius/gitleaks-tools/main/githooks/pre-commit > .git/hooks/pre-commit
	chmod +x .git/hooks/pre-commit
}

checkIfPreCommitExists
ensureGitleaksInstalled