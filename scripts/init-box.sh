
#!/bin/bash
#
# Install required software
#
echo "Installing software "


if [ ! -f ".boxready" ]; then

	sudo apt-get update -y

	echo "Installing apache..."

	sudo apt-get install -y apache2	

	echo "installing MYSQL SERVER..."

	sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
	sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
	sudo apt-get -y -f install mysql-server-5.5


	echo "Installing PHP5..."

	sudo apt-get install -y php5
	sudo apt-get install -y php5-fpm
	sudo apt-get install -y php5-gd
	sudo apt-get install -y php5-mysql
	sudo apt-get install -y memcached
	sudo apt-get install -y php5-memcache
	sudo apt-get install -y php5-curl
	sudo apt-get install -y php5-common
	sudo apt-get install -y libapache2-mod-php5
	sudo apt-get install -y php5-cli

	echo "Installing tools..."

	sudo apt-get install -y git
	sudo apt-get install -y curl

	touch ".boxready"

fi
