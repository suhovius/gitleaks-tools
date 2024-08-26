#!/usr/bin/env bash

ensureGitleaksInstalled() {
  # Check if gitleaks is installed
  if ! [ -x "$(command -v gitleaks)" ]; then
    echo "gitleaks not found. Installing gitleaks..."
    curl -s https://raw.githubusercontent.com/suhovius/gitleaks-tools/main/install.sh | bash

    if ! type "gitleaks" > /dev/null; then
      echo "Failed to install gitleaks. Aborting commit."
      exit 1
    fi
  else
    echo "gitleaks found. Skip gitleaks command install. Proceed with git hooks installation."
  fi  
}

checkIfPreCommitExists() {
	if [ -f .git/hooks/pre-commit ]; then
		echo "WARNING! .git/hooks/pre-commit file already exists!"
		read -p "Override? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
		echo "Overriding the existing .git/hooks/pre-commit file"
		downloadAndInstallPreCommitGitHook
	else
		echo "Installing new .git/hooks/pre-commit file"
		downloadAndInstallPreCommitGitHook
	fi
}

downloadAndInstallPreCommitGitHook() {
	echo "Downloading and installing .git/hooks/pre-commit file"
	curl -s https://raw.githubusercontent.com/suhovius/gitleaks-tools/main/githooks/pre-commit > .git/hooks/pre-commit
	echo "Making .git/hooks/pre-commit file executable"
	chmod +x .git/hooks/pre-commit
}

printPostInstallMessage() {
	printf "GitLeaks pre-commit git hook configuration options:\n"
	printf "\n"
	printf "To enable protect check on the staged changes, use command:\n"
	printf "\tgit config hooks.gitleaks.protect true\n"
	printf "\n"

	printf "To enable detect check on the commited changes, use command:\n"
	printf "\tgit config hooks.gitleaks.detect true\n"
	printf "\n"

	printf "To disable gitleaks pre-commit hooks use such commands:"
	printf "\n"
	printf "\tgit config hooks.gitleaks.protect false\n"
	printf "\tgit config hooks.gitleaks.detect false\n"
	printf "\n"

	printf "Or unset this config parameter completely if you do not need it anymore:\n"
	printf "\tgit config --unset-all --bool hooks.gitleaks.protect\n"
	printf "\tgit config --unset-all --bool hooks.gitleaks.detect\n"
}

ensureGitleaksInstalled
printf "\n"
checkIfPreCommitExists
printf "\n"
printPostInstallMessage
printf "\n"