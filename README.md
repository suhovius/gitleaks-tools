### Git Hooks Intallation

Enter yours project directory with already initialized git repository. Copy this command and run in yours terminal.

`bash <(curl -Ls https://raw.githubusercontent.com/suhovius/gitleaks-tools/main/githooks-install.sh)`

We have to use [process substitution](https://askubuntu.com/questions/423101/access-terminal-stdin-when-its-the-source-of-the-bash-script-itself) ([read docs here](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Process-Substitution)) in order to let the user input (stdin) work; as script might ask permission to override the existing `.git/hooks/pre-commit` file

Example call when `gitleaks` is not installed in the system and project contains existing `pre-commit` git hook file:

```bash
bash <(curl -Ls https://raw.githubusercontent.com/suhovius/gitleaks-tools/main/githooks-install.sh)
gitleaks not found. Installing gitleaks...
Preparing to install gitleaks into /usr/local/bin
gitleaks installed into /usr/local/bin/gitleaks
Run 'gitleaks --help' to see what you can do with it.

WARNING! .git/hooks/pre-commit file already exists!
Override? (Y/N): Yes
Overriding the existing .git/hooks/pre-commit file
Downloading and installing .git/hooks/pre-commit file
Making .git/hooks/pre-commit file executable
```

### Enable/Disable

Use git config option `hooks.gitleaks` to switch on/off gitleaks check 

Enable gitleaks check

`git config --local --bool hooks.gitleaks true`

Disable gitleaks check

`git config --local --bool hooks.gitleaks false`

Or unset this config parameter completely if you do not need it anymore

`git config --unset-all --bool hooks.gitleaks`

### Separate Gitleaks Installation (Can be installed automatically via .githooks/pre-commit)

You can use these calls to install the gitleaks only without any pre commit hooks.

```bash
# Install script (latest release):
# wget:
wget -q -O - https://raw.githubusercontent.com/suhovius/gitleaks-tools/main/install.sh | bash
# curl:
curl -s https://raw.githubusercontent.com/suhovius/gitleaks-tools/main/install.sh | bash

# Install script (specific release via TAG environment variable):
# wget:
wget -q -O - https://raw.githubusercontent.com/suhovius/gitleaks-tools/main/install.sh | TAG=v8.18.1 bash
# curl:
curl -s https://raw.githubusercontent.com/suhovius/gitleaks-tools/main/install.sh | TAG=v8.18.1 bash
```

