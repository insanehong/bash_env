####### .bash_profile

###### General
export LANGUAGE=ko_KR.UTF-8
export LANG="ko_KR.UTF-8"
export LC_ALL="ko_KR.UTF-8"

###### PATH
export PLAY_HOME=~/.play-2.1.0
export PATH=/usr/local/bin:/usr/bin:/usr/local/sbin:$PLAY_HOME:$PATH

###### color setting
c_clean="\033[0m"
c_reverse="\033[07m"
b_block="\033[40"
b_red="\033[41"
b_green="\033[42"
b_yello="\033[43"
b_blue="\033[44"
b_magenta="\033[45"
b_cyan="\033[46"
b_white="\033[47"
t_base="\033["
t_block=";30m"
t_red=";31m"
t_green=";32m"
t_yello=";33m"
t_blue=";34m"
t_magenta=";35m"
t_cyan=";36m"
t_white=";37m"
t_bold=";1"

c_branch="⭠"
c_separator="⮀"

DVCS_BRANCH="${b_green}${b_bold}${t_block} ${c_branch} %b ${b_green}${b_bold}${t_red}%m%u%a "
DVCS_TYPE="${b_cyan}${t_bold}${t_green}${c_separator}${b_cyan}${t_bold}${t_white} %s " 
DVCS_HASH="${b_blue}${b_bold}${t_cyan}${c_separator}${b_blue}${b_bold}${t_white} @%h "
DVCS_SEPARATOR="${c_clean}${t_base}${b_bold}${t_blue}${c_separator}${c_clean}${t_base}${t_bold}${t_magenta}${c_reverse}⮀${c_clean}"

show_repository ()
{
	echo -e "$(VCPROMPT_FORMAT=${DVCS_BRANCH}${DVCS_TYPE}${DVCS_HASH}${DVCS_SEPARATOR} vcprompt)"
}

export PS1='\n$(show_repository)\[\033[45;1;37m\] \u \[\033[41;1;35m\]⮀\[\033[41;1;37m\] \h \[\033[43;1;31m\]⮀\[\033[43;1;30m\] \w \[\033[0m\[\033[1;33m\]⮀\033[0m \n\[\033[40;1;33m\] ⚡  \[\033[0m\]\[\033[1;30m\]⮀\[\033[0m\] '
export TERM=xterm-256color

# Bash Exports

# vcprompt environment variables
export VCPROMPT_STAGED="⚙"
export VCPROMPT_MODIFIED="±"
export VCPROMPT_UNTRACKED="✘"

# some settings to be more colorful
export CLICOLOR=1
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export LSCOLORS=ExGxFxdxCxDxDxBxBxExEx
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'


# use Vim as default editor
export EDITOR="/usr/local/bin/vim"
export VISUAL=$EDITOR
set showmatch
set smartindent
set enc=UTF-8
set fileencodings=UTF-8

###### Node Version Manager
###### 'NVM_NODE_VERSION': https://github.com/andrwj/nvm
if [[ -s "$HOME/.nvm/nvm.sh" ]]; then
	export NVM_DIR="$HOME/.nvm"
	source "$HOME/.nvm/nvm.sh"
	export NODE_PATH="$HOME/.nvm/`nvm_version`/lib/node_modules/"
	[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion
else
	export NODE_PATH=/usr/local/lib/node_modules/
fi

###### for python virtual environments
if [[ -e "$HOME/.virtualenvs" ]]; then
	export WORKON_HOME=$HOME/.virtualenvs
	export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2.7
	export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
	export PIP_VIRTUALENV_BASE=$WORKON_HOME
	export PIP_RESPECT_VIRTUALENV=true
	if [[ -r /usr/local/share/python/virtualenvwrapper.sh ]]; then
		source /usr/local/share/python/virtualenvwrapper.sh
	else
		echo "WARNING: Can't find virtualenvwrapper.sh"
	fi
fi

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
else # OS X `ls`
	colorflag="-G"
fi

# aliases
alias l="ls -l ${colorflag}"
alias ll="ls -la ${colorflag}"
alias lsd='ls -l ${colorflag} | grep "^d"'
alias ls="command ls ${colorflag}"
alias top_commands="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ifconfig getifaddr en1"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"
alias whois="whois -h whois-servers.net"
alias dsclean="find . -type f -name '*.DS_Store' -ls -delete"
alias ..="cd .."
alias ...="cd ../../"
alias top='top -o cpu'
alias gs='git status'
alias gl='git lg1'
alias gl2='git lg2'
alias gla='git lga'
alias glf='git lgf'
alias gm='git mg'
alias gf='git fc'
alias gb='git br'
alias gc='git co'
alias gcb='git co -b'
alias gp='git push'
alias gpf='git push -f'
alias gbd='git br -D'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gr='git rebase'
alias gri='git rebase -i'
alias grh='git reset --hard'

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
