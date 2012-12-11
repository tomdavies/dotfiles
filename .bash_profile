# Load ~/.bash_prompt, ~/.exports, ~/.aliases, ~/.functions and ~/.extra
# ~/.extra can be used for settings you don’t want to commit
for file in ~/Dropbox/dotfiles/.{bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Prefer UK English and use UTF-8
export LC_ALL="en_GB.UTF-8"
export LANG="en_GB"

########################
# Tab completion stuff #
########################

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

#source ~/Dropbox/dotfiles/.rails.bash

# Enable git command completion
. ~/.git-bash-completion.sh
. ~/.git-flow-completion.sh

#complete -C ~/.rake-completion.rb -o default rake


complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null  || complete -o default -o nospace -F _git g


# bash-completion
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi


# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

