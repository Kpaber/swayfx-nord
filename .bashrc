# ~/.bashrc: executed by bash(1) for non-login shells.

# Если шелл запущен не интерактивно — сразу выходим
case $- in
    *i*) ;;
      *) return;;
esac

# История: без дубликатов и строк, начинающихся с пробела
HISTCONTROL=ignoreboth:erasedups
HISTSIZE=5000
HISTFILESIZE=10000

# Дописывать историю в файл, а не перезаписывать его
shopt -s histappend

# Обновлять значения LINES и COLUMNS после каждой команды при ресайзе окна
shopt -s checkwinsize

shopt -s checkwinsize
shopt -s autocd 
shopt -s cdspell
shopt -s dirspell

# Цветной вывод для ls и grep
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# Подгрузка отдельных алиасов, если файл существует
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Умное автодополнение флагов и команд (bash-completion)
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# Твой минималистичный промпт
PS1='\[\033[01;32m\]\w\[\033[00m\] \[\033[01;31m\]>\[\033[00m\] '

# opencode (с проверкой, чтобы путь не дублировался при перезагрузке конфига)
export PATH="/home/kpaber/.opencode/bin:$PATH"
