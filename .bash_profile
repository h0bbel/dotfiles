#
# .bash_profile
#
# @author Christian Mohn
#

# Prompt moved to .bash_prompt
# aliases moved to .bash_aliases


# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;


# Functions

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Autocomplete all the things
# Requirements:
#	brew install bash-completion
#	brew tap homebrew/completions

if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi


# Git

# Turn on Git autocomplete. src=https://github.com/geerlingguy/dotfiles/blob/master/.bash_profile

brew_prefix=`brew --prefix`
if [ -f $brew_prefix/etc/bash_completion ]; then
  . $brew_prefix/etc/bash_completion
fi


export PATH=~/usr/bin:$PATH

# Include alias file (if present) containing aliases for ssh, etc.
if [ -f ~/.bash_aliases ]
then
  source ~/.bash_aliases
fi

# Include bash_prompt file (if present) containing my snazzy prompt.
if [ -f ~/.bash_prompt ]
then
  source ~/.bash_prompt
fi


