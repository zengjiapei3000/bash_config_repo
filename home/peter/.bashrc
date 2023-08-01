#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
## PS1='[\u@\h \W]\$ '

## Add on 2022-03-17, for chrome video hardware.
#export LIBVA_DRIVER_NAME=vdpau
#export VDPAU=nvidia
export VDPAU=vdpau
export NVDEC=nvidia

## Add on 2022-03-05, for java-11-openjdk, the optional dependent 
# of erlang 24.1.7, managed by asdf-erlang.
JAVA_HOME=/usr/lib64/java-11-openjdk
PATH=$PATH:$JAVA_HOME/bin
## End add on 2022-03-05, for java-11-openjdk, the optional dependent 
# of erlang 24.1.7, managed by asdf-erlang.

## Add on 2022-02-27, for after install asdf-vm(AUR) package,
# refer to https://asdf-vm.com/guide/getting-started.html#_3-install-asdf
#. /opt/asdf-vm/asdf.sh
# End add on 2022-02-27, for after install asdf-vm(AUR) package.

## Add on 2022-02-27, for additional configure asdf-vm(AUR) package,
# refer to https://asdf-vm.com/manage/configuration.html#environment-variables
export ASDF_DEFAULT_TOOL_VERSIONS_FILENAME=".tool_versions"
## End add on 2022-02-27, for additional configure asdf-vm(AUR) package,
# refer to https://asdf-vm.com/manage/configuration.html#environment-variables

## Created by `pipx` on 2021-06-04 10:21:52
export PATH="$PATH:/home/peter/.local/bin"

# Add manually on 2022-01-22 19:25
# Use fish as default shell, but keep bash to login shell
# keep this line at the bottom of ~/.bashrc

# first, To have commands such as bash -c 'echo test' run the command in Bash instead of starting fish.
# this section must above the next section.
# if [ -z "$BASH_EXECUTION_STRING" ]; then exec fish; fi

# second, Drop in to fish only if the parent process is not fish.
# This allows to quickly enter in to bash by invoking `bash` command without losing `~/.bashrc` configuration:
if [[ $(ps --no-header --pid=$PPID --format=cmd) != "fish" && -z ${BASH_EXECUTION_STRING} ]]
then
	exec fish
fi
## End manually on 2022-01-22 19:25

### Comment on 2023-05-31 13:30
#
## Add on 2022-02-16 02:21
# to using zsh but login shell is keep in bash.
#if [[ $(ps --no-header --pid=$PPID --format=cmd) != "zsh" && -z ${BASH_EXECUTION_STRING} ]]
#then
#	exec zsh
#fi
## End add on 2022-02-16 02:21


## Add on 2022-02-17 10:39
# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion
## End add on 2022-02-17 10:39


# Automatically added by the Guix install script.
if [ -n "$GUIX_ENVIRONMENT" ]; then
    if [[ $PS1 =~ (.*)"\\$" ]]; then
        PS1="${BASH_REMATCH[1]} [env]\\\$ "
    fi
fi

# Manually add at 2023/07/16, for after `guix pull`
GUIX_PROFILE="/home/peter/.guix-profile"
. "$GUIX_PROFILE/etc/profile"
hash guix
