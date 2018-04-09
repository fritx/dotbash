#!/usr/bin/env bash
# inspired by https://github.com/mathiasbynens/dotfiles

### session
export PS1='\W\$ ' # 简化前缀 如`xxx$`
# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

for file in ~/.bash_include ~/.bash_personal
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
alias gch='g checkout'
alias gs='g status'
alias gd='g diff'
alias gp='g pull'
alias gst='g stash'
alias gstap='g stash apply'
alias gp='g pull'
alias gstp='gst && gp && gstap'

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

alias n8='nvm use 8.11.1'
alias n9='nvm use 9.11.1'
alias ni="npm i"
alias nr="npm run"
alias ns="npm start"
alias nt="npm test"
alias nv="npm view"
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
