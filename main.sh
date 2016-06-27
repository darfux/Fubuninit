#!/bin/bash

if [[ ! -z $SUDO_USER ]]; then
	echo "Don't run this in sudo!"
	exit 1
fi

mkdir -p log
ERROR_LOG="log/error.log"
INFO_LOG="log/info.log"
trace=""

# https://github.com/ab/bin/blob/master/bash-backtrace.sh
bash_backtrace() {
    local i=0
    local FRAMES=${#BASH_SOURCE[@]}


    echo  "Traceback (most recent call last):"

    for ((frame=FRAMES-2; frame >= 1; frame--)); do
        local lineno=${BASH_LINENO[frame]}

        printf  '  File "%s", line %d, in %s\n' \
            "${BASH_SOURCE[frame+1]}" "$lineno" "${FUNCNAME[frame+1]}"

        sed  -n "${lineno}s/^[   ]*/    /p" "${BASH_SOURCE[frame+1]}"
    done
}


# http://stackoverflow.com/questions/64786/error-handling-in-bash#answer-185900
error() {
  local parent_lineno="$1"
  local message="$2"
  local code="${3:-1}"
  printf "\n[ERROR]\n ${message} \n $trace ; \n exiting with status ${code}\n"
  exit "${code}"
}
trap 'error ${LINENO} "$(cat $ERROR_LOG)"' ERR

run() {
  trace=$(bash_backtrace)
  bash -e $1.sh > >(tee --append $INFO_LOG)  2> >(tee $ERROR_LOG >&2)
}


# run fail_apt
run setup_directory
run change_source_list
run setup_proxy
run install_zsh
run install_ruby
run install_basic_packages
run terminal_config

source /home/darfux/.rvm/scripts/rvm
cd ruby_task
rvmsudo -E ruby main.rb

