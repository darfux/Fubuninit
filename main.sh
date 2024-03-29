#!/bin/bash

if [[ ! -z $SUDO_USER ]]; then
	echo "Don't run this in sudo!"
	exit 1
fi

set -eux
export LOG_DIR="${HOME}/.Fubuninit/log"
export TMP_DIR="${HOME}/.Fubuninit/tmp"
mkdir -p "${LOG_DIR}"
mkdir -p "${TMP_DIR}"
ERROR_LOG="${LOG_DIR}/error.log"
INFO_LOG="${LOG_DIR}/info.log"
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

disable_auto_upgrade() {
  sudo bash -c "killall dpkg; killall aptd; true"

  sudo mv /usr/bin/update-manager /usr/bin/update-manager.bak
  sudo mv /usr/bin/unattended-upgrade /usr/bin/unattended-upgrade.bak
  sudo bash -c "echo \"#\!/usr/bin/python3\" > /usr/bin/update-manager"
  sudo bash -c "echo \"#\!/usr/bin/python3\" > /usr/bin/unattended-upgrade"

  # sudo fuser -cuk /var/lib/dpkg/lock;     sudo rm -f /var/lib/dpkg/lock
  # sudo fuser -cuk /var/lib/apt/lists/lock; sudo rm -f /var/lib/apt/lists/lock
}

enable_auto_upgrade() {
  sudo mv /usr/bin/update-manager.bak /usr/bin/update-manager
  sudo mv /usr/bin/unattended-upgrade.bak /usr/bin/unattended-upgrade
}


# http://stackoverflow.com/questions/64786/error-handling-in-bash#answer-185900
error() {
  # enable_auto_upgrade
  local parent_lineno="$1"
  local message="$2"
  local code="${3:-1}"
  printf "\n[ERROR]\n ${message} \n $trace ; \n exiting with status ${code}\n"
  exit "${code}"
}
trap 'error ${LINENO} "$(cat $ERROR_LOG)"' ERR

run() {
  jobname="$1"
  trace=$(bash_backtrace)
  donefile="${LOG_DIR}/${jobname}.done"
  if [[ -f "${donefile}" ]]; then
      echo "${jobname} has been done, skip"
      return
  fi
  bash -e $1.sh > >(tee --append $INFO_LOG)  2> >(tee $ERROR_LOG >&2)
  touch "${donefile}"
}



#check connection
echo "Checking network connection..."
if ping -c 1 mirrors4.tuna.tsinghua.edu.cn >> /dev/null 2>&1; then
    echo "network ok"
else
    echo "network not work, please check it!"
    exit 1
fi

# temporarily disable auto upgrade
# disable_auto_upgrade

run setup_directory
run change_source_list
run install_basic_packages

run setup_proxy
export http_proxy="http://127.0.0.1:8123"
export https_proxy=http://127.0.0.1:8123

run install_zsh
run install_ruby
run terminal_config

set +eux
source /home/darfux/.rvm/scripts/rvm
cd ruby_task
unset http_proxy
unset https_proxy
rvmsudo -E ruby main.rb

# enable_auto_upgrade
