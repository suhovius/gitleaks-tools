### Gitleaks Installation (Can be installed automatically via .githooks/pre-commit)

```bash
# Install script (latest release):
# wget:
wget -q -O - https://raw.githubusercontent.com/suhovius/scripts/main/gitleaks/install.sh | bash
# curl:
curl -s https://raw.githubusercontent.com/suhovius/scripts/main/gitleaks/install.sh | bash

# Install script (specific release via TAG environment variable):
# wget:
wget -q -O - https://raw.githubusercontent.com/suhovius/scripts/main/gitleaks/install.sh | TAG=v8.18.1 bash
# curl:
curl -s https://raw.githubusercontent.com/suhovius/scripts/main/gitleaks/install.sh | TAG=v8.18.1 bash
```

### Git Hooks

`.githooks` folder contains githooks files for the `gitleaks` comand. In order to use it at yours project, you need to copy it to yours project directory. 

Make ensure that `.githooks` files are executable:

`find .githooks -type f -exec chmod +x {} \;`

#### Setup

Read more here [https://www.viget.com/articles/two-ways-to-share-git-hooks-with-your-team/](https://www.viget.com/articles/two-ways-to-share-git-hooks-with-your-team/)

Choose githooks installation method

If you're using Git version 2.9 or greater, assign the `core.hooksPath` configuration variable to managed hooks directory:

`$ git config core.hooksPath .githooks`

If you're using an earlier version, you need to ensure that your managed hooks make it into the `.git/hooks` directory. Symlink `.githooks` to `.git/hooks`, just make sure to clear the old ones out first:

`$ find .git/hooks -type l -exec rm {} \; && find .githooks -type f -exec ln -sf ../../{} .git/hooks/ \;`

#### Enable/Disable

Use git config option `hooks.gitleaks` to switch on/off gitleaks check 

Enable gitleaks check

`git config --local --bool hooks.gitleaks true`

Disable gitleaks check

`git config --local --bool hooks.gitleaks false`

Or unset this config parameter completely if you do not need it anymore

`git config --unset-all --bool hooks.gitleaks`