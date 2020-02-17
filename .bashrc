# **********************************************
# *  ~/.bashrc personalizado                  **
# *  local: $HOME/.bashrc                     **
# *                                           **
# *  Autor: Ricky Lemes Habegger              **
# *  Email: rickylemeshabegger@gmail.com      **
# *                                           **
# **********************************************
# ==============================================
#-----------------------------------------------
#----        Configurações Gerais           ----
#-----------------------------------------------
 
# Se não estiver rodando interativamente, não fazer nada
[ -z "$PS1" ] && return

# Desabilitar I/O de dados ctrl+s e ctrl+q
stty -ixon

# Não armazenar as linhas duplicadas ou linhas que começam com espaço no historico
HISTCONTROL=ignoreboth

# Adicionar ao Historico e não substitui-lo
shopt -s histappend

# Ativar **
shopt -s globstar

# Ativar vim mode do bash
set -o vi
 
# Definições do comprimento e tamanho do historico.
HISTSIZE=3000
HISTFILESIZE=3000
 
#===========================================
# Váriavies com as Cores
#===========================================
NONE="\[\033[0m\]" # Eliminar as Cores (deixar padrão)
 
## Cores de Fonte
K="\[\033[0;30m\]" # Black
R="\[\033[0;31m\]" # Red
G="\[\033[0;32m\]" # Green
Y="\[\033[0;33m\]" # Yellow
B="\[\033[0;34m\]" # Blue
M="\[\033[0;35m\]" # Magenta
C="\[\033[0;36m\]" # Cyan
W="\[\033[0;37m\]" # White

BBK="\[\033[0;90m\]" # Brilhante Black
BBR="\[\033[0;91m\]" # Brilhante Red
BBG="\[\033[0;92m\]" # Brilhante Green
BBY="\[\033[0;93m\]" # Brilhante Yellow
BBB="\[\033[0;94m\]" # Brilhante Blue
BBM="\[\033[0;95m\]" # Brilhante Magenta
BBC="\[\033[0;96m\]" # Brilhante Cyan
BBW="\[\033[0;97m\]" # Brilhante White
 
## Efeito Negrito e cores
BK="\[\033[1;30m\]" # Bold+Black
BR="\[\033[1;31m\]" # Bold+Red
BG="\[\033[1;32m\]" # Bold+Green
BY="\[\033[1;33m\]" # Bold+Yellow
BB="\[\033[1;34m\]" # Bold+Blue
BM="\[\033[1;35m\]" # Bold+Magenta
BC="\[\033[1;36m\]" # Bold+Cyan
BW="\[\033[1;37m\]" # Bold+White

## Cores de fundo (backgroud)
BGK="\[\033[40m\]" # Black (Preto)
BGR="\[\033[41m\]" # Red (Vermelho)
BGG="\[\033[42m\]" # Green (Verde)
BGY="\[\033[43m\]" # Yellow (Amarelo)
BGB="\[\033[44m\]" # Blue (Azul)
BGM="\[\033[45m\]" # Magenta (Vermelho Claro)
BGC="\[\033[46m\]" # Cyan (Ciano - Azul Claro)
BGW="\[\033[47m\]" # White (Branco)

#00 - Reset (Nenhum) 
#01 - Negrito 
#04 - Sublinhado 
#05 - Piscante 
#07 - Reverso 
#08 - Oculto

#=============================================
# Configurações referentes ao usuário
#=============================================

## Verifica se é usuário root (UUID=0) ou usuário comum
if [ $UID -eq "0" ]; then
    ## Cores e efeitos do Usuario root
    PS1="$W┌─ $BBR\u$R@\h $BBC\w\n$W└─╼ $NONE"
else
    ## Cores e efeitos do usuário comum
    PS1="$W┌─ $BBG\u$G@\h $BBC\w\n$W└─╼ $NONE"
fi

# Outras opcoes de personalizacao
#PS1="$BK┌─[$BG\u$BK]$BK:\w\n$BK└──$BG>>$BK \$ $W"
## Exemplos de PS1
#PS1="$BK┌─[$BG\u$BK]$BK:\w\n$BK└──$BG>>$BK \$ $W"
#PS1="$BR┌─[$BG\u$BR]$BY@$BR[$BW${HOSTNAME%%.*}$BR]$B:\w\n$BR└──>$BG \\$ $NONE"
#PS1='\[\e[m\n\e[1;30m\][$$:$PPID \j:\!\[\e[1;30m\]]\[\e[0;36m\] \T \d \[\e[1;30m\][\[\e[1;34m\]\u@\H\[\e[1;30m\]:\[\e[0;37m\]${SSH_TTY} \[\e[0;32m\]+${SHLVL}\[\e[1;30m\]] \[\e[1;37m\]\w\[\e[0;37m\] \n($SHLVL:\!)\$ '
#PS1="\e[01;31m┌─[\e[01;35m\u\e[01;31m]──[\e[00;37m${HOSTNAME%%.*}\e[01;32m]:\w$\e[01;31m\n\e[01;31m└──\e[01;36m>>\e[00m"
#PS1="┌─[\[\e[34m\]\h\[\e[0m\]][\[\e[32m\]\w\[\e[0m\]]\n└─╼ "
#PS1='[\u@\h \W]\$'
 
#==========================
# DIVERSOS
#==========================
 
force_color_prompt=yes
## Habilitando suporte a cores para o ls e outros aliases
## Vê se o arquivo existe e eh possivel executar
if [ -x /usr/bin/dircolors ]; then
test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
 
## Aliases para comandos
# comando ls 
LS_COLORS='di=1;4;37:fi=31:ln=36:pi=:so=:bd=:cd=93:or=31:mi=0:ex=32:*.rpm=90'
export LS_COLORS
alias lla='ls -lA --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -A --color=auto'
alias ls='ls --color=auto'
alias l='ls -C --color=auto'

# outros comandos
alias dir='dir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
fi # Fim do if do dircolor

# Adiciona o diretorio atual no path
PATH=$PATH:.

#============================================================#
##========            Aliases diversos         ==============# 
#============================================================#
# diretorios
alias ..='cd ..'

alias vi='vim'

alias compact='tar -zcvf'
alias extract='tar -zxvf'

alias so='cd source && l'
alias pdf='cd PDFs && l'
alias ¬=' && exit'

# Habilita o modo educado no terminal
alias please='sudo'

# Configuracoes para o nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash

export TERM=xterm-256color

[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases
[[ -f ~/.bashrc_local ]] && . ~/.bashrc_local
