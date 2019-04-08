# dotfiles
> Bash configuration files

## Usage

Install bash-it, see [https://github.com/Bash-it/bash-it](https://github.com/Bash-it/bash-it) for instructions.

Copy files to `$HOME`.

```sh
cp .bash_profile $HOME
```

## Custom Functions

### Kubernetes Context

Can be enabled by setting `PS1_KUBECTL` to any value (e.g. "true"). Can be permanently enabled by adding `export PS1_KUBECTL="true"` to `.bash_profile` Use in bash-it powerline prompt by adding `kubectl_context` to the variable like shown below.

```
#
export POWERLINE_RIGHT_PROMPT="python_venv kubectl_context aws_profile clock user_info"
```