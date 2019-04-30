# dotfiles
> Bash configuration files

## Table of Contents
* [Usage](#usage)
* [Custom Functions](#custom-functions)
  * [debug](#debug)
* [Custom Functions](#custom-functions-in-bash_profile)
  * [ws](#ws)
  * [wsx](#wsx)
  * [Kubernetes Context](#kubernetes-context)
* [Recommended tools](#recommended-tools)
  * [fd](#fd)
  * [jq](#jq)

## Usage
[🔝 Back to top](#table-of-contents)
Install bash-it, see [https://github.com/Bash-it/bash-it](https://github.com/Bash-it/bash-it) for instructions.

Copy files to `$HOME`.

```sh
cp .bash_profile $HOME
```

## Custom Functions
[🔝 Back to top](#table-of-contents)
Inside the `bin` directory are some custom scripts that can be linked or copied to `$HOME/bin` or any other bin directory in your `$PATH`, e.g. `/usr/local/bin`.

### debug
[🔝 Back to top](#table-of-contents)
This function pipes all output of a shell script into a log file named `$command-$date.log`, where `$command` is the executed command (`$1`) and `$date` is the date in the format `%y%m%d-%H%M%S` (e.g. for April 30th, 2019 at 09:17am it would be 20190330-091734).

Syntax
```sh
$ debug [command] [...args]
```

Usage

```sh
$ debug echo "Hello world"
$ cat echo-20190330-091734.log
Hello world
```

## Custom Functions in `.bash_profile`
[🔝 Back to top](#table-of-contents)

### `ws`
[🔝 Back to top](#table-of-contents)

`ws` searches for a directory in a "workspace" (`~/Development` on my machine) and moves the terminal into the directory if it exists. If not it goes to `~/Development`.

You can set `$WS_WORKSPACE` to the workspace directory if yours is not `~/Development`.

```sh
WS_WORKSPACE="$HOME/Nextcloud/Workspace"
```

Usage

```
$ ws SOME_NAME
```

### `wsx`
 [🔝 Back to top](#table-of-contents)

`wsx` is `w`ork`s`pace e`x`ecute. It can be used to execute a command in a workspace directory. 

*BE WARNED:* You may not end up in the directory you want to go if you have similarly named folders. I only use this if I know I end up in the right folder.

Example: Start docker-compose from a client repo stored in `~/Development/synoa/magento/clientname`. 
```sh
cd ~
wsx clientname docker-compose up -d
```

The first argument is the name we want to execute the command in, everything afterwards will be executed as command.

### Kubernetes Context
[🔝 Back to top](#table-of-contents)

Can be enabled by setting `PS1_KUBECTL` to any value (e.g. "true"). Can be permanently enabled by adding `export PS1_KUBECTL="true"` to `.bash_profile` Use in bash-it powerline prompt by adding `kubectl_context` to the variable like shown below.

```
export POWERLINE_RIGHT_PROMPT="python_venv kubectl_context aws_profile clock user_info"
```

## Recommended tools
[🔝 Back to top](#table-of-contents)

Unordered and incomplete list of additional software I use:

### `fd`
> [https://github.com/sharkdp/fd](https://github.com/sharkdp/fd)
A find replacement written in Rust. More powerful and easier to use than `find`. 

### `jq`
> [https://stedolan.github.io/jq/](https://stedolan.github.io/jq/)
Makes working with JSON on the terminal a lot easier. 
