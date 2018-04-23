#!/usr/bin/env bash
# inspired by https://github.com/mathiasbynens/dotfiles

### session
export PS1='\W\$ ' # 简化前缀 如`xxx$`
# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

for file in ~/.bash_include ~/.bash_private
do
	[ -r $file ] || touch $file
  . $file
done

alias c='cd'
alias ..='c ..'
alias ...='c ../..'
alias o=open
alias o.='open .'

### utils
alias ydl='youtube-dl'
alias fy='fanyi'
alias j='jayin'
alias sshr="ssh root@$VPS_IP"

# https://github.com/sindresorhus/trash-cli
# https://github.com/andreafrancia/trash-cli
# alias rm=trash
alias rm='echo "This is not the command you are looking for."; false'

### editors
export EDITOR=code
alias edit=code
alias e=edit
alias e.='e .'

### bash
export BASHRC='~/.bashrc'
alias bse="e $BASHRC"
alias bss=". $BASHRC"

### brew, brewcask
alias b='brew'
alias bs='b search'
alias bi='b install'
alias bc='b cask'
alias bcs='bc search'
alias bci='bc install'

### git
alias g=git
alias gcl='g clone'
alias gb='g branch'
alias gbc='git branch | grep "*"'
alias gch='g checkout'
alias gs='g status'
alias gl='git log'
alias gd='g diff'
alias gp='g pull'
alias gst='g stash'
alias gstap='g stash apply'
alias gp='g pull'
alias gstp='gst && gp && gstap'
alias ga='git add'
alias gm='EDITOR=vim g merge --no-ff'
alias gmff='EDITOR=vim g merge --ff'
alias grs='g reset'
alias grb='g rebase'
alias gcp='g cherry-pick'

### db
# see `brew info *`
alias mgd="mongod --config /usr/local/etc/mongod.conf"
alias rds="redis-server /usr/local/etc/redis.conf"

### nvm, node
# see `brew info *`
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# nvm 使用淘宝镜像 https://www.chenky.com/archives/746
export NVM_NODEJS_ORG_MIRROR=http://npm.taobao.org/mirrors/node

# electron淘宝镜像 供electron-download系列使用
# https://github.com/electron-userland/electron-download
export ELECTRON_MIRROR="https://npm.taobao.org/mirrors/electron/"

alias n8='nvm use 8.11.1'
alias n9='nvm use 9.11.1'
alias ni="npm i"
alias nr="npm run"
alias ns="npm start"
alias nst="nr stop"
alias nd="nr dev"
alias nt="npm test"
alias nv="npm view"
alias nb="nr build"
alias bfs="ni --build-from-source"
alias y="yarn"
alias yd="yarn dev"
alias yb="yarn build"
alias prs="pm2 resurrect"

### shortcuts

# npm rush register
function npm_reg() {
  # ~/d is the directory where i develop
  cd ~/d
  mkd "$1"
  npm init -y
  # version `0.0.0` instead of `1.0.0`
  cat package.json | \
    j -to 'x.version = `0.0.0`, JSON.stringify(x, null, 2)+`\n`'  \
    > package.json
  npm publish
}
