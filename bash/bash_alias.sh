## Common alias
alias ..='cd ../'
alias ll='ls -alF --color=auto'
alias r__clean='sudo apt autoremove --dry-run && sudo apt autoremove'
alias r__update='sudo apt-get update && sudo apt-get upgrade'

## Full functions (OS only)
r__install(){ sudo apt-get install "$@"; }

r__updatePackages(){ sudo apt-get --with-new-packages upgrade "$@"; }

r__remove(){ sudo apt remove "$@" && r__clean; }

r__fullCommands(){
	echo "--Full-Commands--"
	alias | sort
	echo -e "\n--Functions--"
	declare -F | awk '{print $3}' | sort
}

## Full functions (general software)
r__gcc(){
	if [ -z "$1" ]; then
		echo "Error: No .ccp file declared"
		return 1
	fi
	if [ ! -f "$1" ]; then
		echo "Error: Not file found"
		return 1
	fi
	g++ "$1" -o bash_out_cpp
	if [ $? -eq 0 ]; then
		echo "Succeful Compilation"
		./bash_out_cpp
		echo "Finished"
		rm bash_out_cpp
	else
		echo "Compilation Error"
		[ -f bash_out_cpp ] && rm bash_out_cpp
		return 1
	fi
}

