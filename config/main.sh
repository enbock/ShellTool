
export CFG=$PRG/config
export ENV_FILE=$CFG/env_file
export DATA=$PRG/data
export TMP=$PRG/tmp
export MODULES=$PRG/modules
export DIALOG=dialog

. $ENV_FILE

include() {
	. $MODULES/$1
}

module() {
	include $1/function.sh
}

run()
{
	prg=$1
	shift
	if test -n "$1"
	then
		function=$1
		shift
	else
		function=main
	fi
	#echo "RUN $prg $function..."
	include $prg/$function.sh $function "$@"
}

export -f include module run

