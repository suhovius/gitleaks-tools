# GitLeaks Tools

This repository contains curl script installer and configurable pre-commit hook script installer for [gitleaks](https://github.com/gitleaks/gitleaks) tool.

### Git Hooks Intallation

Enter yours project directory with already initialized git repository. Copy/paste this command in yours terminal and hit Enter button to run it.

`bash <(curl -Ls https://raw.githubusercontent.com/suhovius/gitleaks-tools/main/githooks-install.sh)`

[Process substitution](https://askubuntu.com/questions/423101/access-terminal-stdin-when-its-the-source-of-the-bash-script-itself) ([read docs here](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Process-Substitution)) was used in order to let the user input (stdin) work; as script might ask permission to override the existing `.git/hooks/pre-commit` file

Example call when `gitleaks` is not installed in the system and target project contains existing `pre-commit` git hook file:

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

GitLeaks pre-commit git hook configuration options:

To enable protect check on the staged changes, use command:
        git config hooks.gitleaks.protect true

To enable detect check on the commited changes, use command:
        git config hooks.gitleaks.detect true

To disable gitleaks pre-commit hooks use such commands:
        git config hooks.gitleaks.protect false
        git config hooks.gitleaks.detect false

Or unset this config parameter completely if you do not need it anymore:
        git config --unset-all --bool hooks.gitleaks.protect
        git config --unset-all --bool hooks.gitleaks.detect
```

### Enable/Disable Configuration

Use git config options `hooks.gitleaks.protect` and `hooks.gitleaks.detect` to switch on/off gitleaks checks respectively. 

#### Enable gitleaks checks

`git config hooks.gitleaks.protect true` - check on the staged changes

`git config hooks.gitleaks.detect true` - check on the commited changes

#### Disable gitleaks checks

`git config hooks.gitleaks.protect false`

`git config hooks.gitleaks.detect false`

#### Remove gitleaks git config options

Unset these config parameters completely if you do not need them anymore:

`git config --unset-all --bool hooks.gitleaks.protect`

`git config --unset-all --bool hooks.gitleaks.detect`

### Separate Gitleaks Installation (Can be installed automatically via installed pre-commit git hook)

You can use these calls to install the `gitleaks` command only without any pre commit hooks.

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

