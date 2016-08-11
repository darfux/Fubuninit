apt_getw() {
	COUNTER=0
	apt_exit_code=0
	while [ $COUNTER -lt 10 ]; do
		set +e
		sudo apt-get $@ 2>&1
		apt_exit_code=$?
		set -e
		# echo $VAR | grep -q "11: Resource temporarily unavailable"

		if [ $apt_exit_code -ne 0 ]; then
			echo $(sudo fuser /var/lib/)
			echo "Apt resource unavaliable now, waiting..."
			COUNTER=$(( COUNTER + 1 ))
			sleep $COUNTER
		else
			echo "Apt ok"
			break
		fi
	done

	if [ $COUNTER -gt 9 ];then
		echo "Retry failed, exit"
	fi

	return $apt_exit_code
}
