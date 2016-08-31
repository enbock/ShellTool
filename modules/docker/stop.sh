
shift
shift
case $1 in
	admin2)
		(cd ~/work/Admin2-Reboot
		MOUNT_PATH=. DATASET=test DOCKER_TAG=master docker-compose -f docker-compose-dev.yml stop
		DATASET=test DOCKER_TAG=master docker-compose -f /home/ebock/dcs/admin2-reboot/backend-reboot/docker-compose.yml -f /home/ebock/dcs/admin2-reboot/backend-reboot/docker-compose-data.yml stop
		DOCKER_TAG=master DATASET=test docker-compose -f /home/ebock/dcs/admin2-reboot/solr-reboot/docker-compose.yml -f /home/ebock/dcs/admin2-reboot/solr-reboot/docker-compose-data.yml stop
		)
	;;
esac

