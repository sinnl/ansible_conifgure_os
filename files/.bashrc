# .bashrc

export TERM=xterm-256color
PS1='\e[0;32m\]\u\e[m\]@\e[0;33m\]\h\e[3;31m\] :)\e[m\]\e[3;36m\]$(echo $ver )\e[m\]\e[3;35m\] ${PWD} \$ >\[\e[m\]\no '
# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'
alias pretty='python -mjson.tool | pygmentize -l json'
alias ccat='pygmentize -f terminal256 -O style=native,linenos=1 -g'
alias cat='ccat'
alias test-module='/root/Ansible/src/ansible/hacking/test-module.py'
alias beatur='ssh -l beatur2011 beatur2011.nazwa.pl'

export EDITOR='vim'
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

function yaml_to_json {
	file=$1
	python -c "import yaml,pprint; pprint.pprint(yaml.load(open(\"$file\").read()))"
}

PATH=/repo/bin:$PATH

#figlet -f 'doh' -w 350  '#! ITLuk' ; neofetch
neofetch
