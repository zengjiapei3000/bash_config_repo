#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
if [ -e /home/peter/.nix-profile/etc/profile.d/nix.sh ]; then . /home/peter/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# Created by `pipx` on 2021-06-04 10:21:52
export PATH="$PATH:/home/peter/.local/bin"
if [ -n "$PYTHONPATH" ]; then
    export PYTHONPATH='/home/peter/.local/pipx/venvs/pdm/lib/python3.9/site-packages/pdm/pep582':$PYTHONPATH
else
    export PYTHONPATH='/home/peter/.local/pipx/venvs/pdm/lib/python3.9/site-packages/pdm/pep582'
fi
