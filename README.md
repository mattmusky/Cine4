# 🎥 Cine4 - Final
Web app enabling users to discover, save and share movie lists with friends.

## Installation Steps

Create the following virtual machines with the corresponding static IP

Host|IP|Services
-----|-----|-----
490-DEPLOY|10.2.2.5|`cine4_dep.service`
490-PROD-LB|10.2.2.10|`Apache Load Balancer`
490-PROD-FE|10.2.2.11|`cine4_depback.service* cine4_femon.service*`
490-PROD-BE|10.2.2.12|`cine4_auth.service* cine4_data.service* cine4_depback.service* cine4_log.service*`
490-PROD-DMZ|10.2.2.13|`cine4_api.service* cine4_depback.service* cine4_dmzrmqmon.service*`
490-PROD-FE-HSB|10.2.2.21|`cine4_depback.service* cine4_femon.service*`
490-PROD-BE-HSB|10.2.2.22|`cine4_auth.service cine4_bemon.service* cine4_data.service cine4_depback.service* cine4_log.service`
490-PROD-DMZ-HSB|10.2.2.23|`cine4_api.service cine4_depback.service* cine4_dmzhsbrmqmon.service* cine4_dmzmon.service*`
490-QA-FE|10.2.2.31|`cine4_depback.service*`
490-QA-BE|10.2.2.32|`cine4_auth.service* cine4_data.service* cine4_depback.service* cine4_log.service*`
490-QA-DMZ|10.2.2.33|`cine4_api.service* cine4_depback.service*`
490-DEV-FE|10.2.2.41|`cine4_depback.service*`
490-DEV-BE|10.2.2.42|`cine4_auth.service* cine4_data.service* cine4_depback.service* cine4_log.service*`
490-DEV-DMZ|10.2.2.43|`cine4_api.service* cine4_depback.service*`

To setup each machine, follow the steps below for the corresponding group;

### FE Machines
1. Install dependencies
```
apt-get install apache2 libapache2-mod-php7.0 php-amqp php7.0 git
```
2. Clone project repository to home folder
```
git clone https://github.com/mattmusky/cine4 ~/
```

##### Configure Apache
3. Create symlink from project to apache www directory
```
sudo ln -s ~/cine4/public /var/www
```
4. Change apache "DocumentRoot" to /var/www/public
```
sudo vi /etc/apache2/sites-available/000-default.conf
```
5. Create symlink to php amqp.ini for Apache
```
sudo ln -s /etc/php/mods-available/amqp.ini /etc/php/7.0/apache2/conf.d/
```
6. Restart apache
```
sudo service apache2 restart
```
7. Configure Apache LB machine with +H for both FE machines


### BE Machines
1. Install dependencies
```
sudo apt-get install php7.0 php-amqp rabbitmq-server php7.0-mysql mysql-server git
```
2. Clone project repository to home folder
```
git clone https://github.com/mattmusky/cine4 ~/
```
3. Create symlink to PHP amqp.ini for CLI
```
sudo ln -s /etc/php/mods-available/amqp.ini /etc/php/7.0/cli/conf.d
```
##### Configure RMQ
4. Import config
```
rabbitmqadmin -q import ~/cine4/config/cine4_rabbitMQ.json
```

##### Configure MySQL
  + Create User: cine4, Password: infinity
  + Create Database: cine4
  + Run ~/cine4/config/cine4.sql

5. Setup live binary log replication on HSB machine

### DMZ Machines
1. Install dependencies
```
apt-get install php7.0 php-amqp curl php-curl git
```
2. Clone project repository to home folder
```
git clone https://github.com/mattmusky/cine4 ~/
```
3. Create symlink to PHP amqp.ini for CLI
```
sudo ln -s /etc/php/mods-available/amqp.ini /etc/php/7.0/cli/conf.d
```

### Deploy Server
1. Follow all FE and BE steps
2. Create the CineDeploy database:
```
Run ~/cine4/config/deploy.sql
```
3. Import the RMQ Configuration file:
```
rabbitmqadmin -q import ~/cine4/config/deploy_rabbitMQ.json
```
4. Run deploy script on any server to activate
```
php deploy.php help
```

### Run Services
1. Add the required services from the table above to each machine
```
sudo ln -s /home/cine/cine4/config/services/SERVICE_NAME.service /etc/systemd/system
```
1. Set all * services to run on boot
```
systemctl enable SERVICE_NAME
```


## Built With
* [TMDB API](https://developers.themoviedb.org/4/getting-started) - Movie Data
* [Bootstrap 4](https://getbootstrap.com/) - Web Framework
* [RabbitMQ](https://www.rabbitmq.com/) - Message Broker
* [ohSnap](https://justindomingue.github.io/ohSnap/) - Alert Popups

## Authors

* **Matt Muscarella** - *RabbitMQ, PHP, JS, Bootstrap*
* **Muzammil Khan** - *HTML, CSS, Bootstrap*
* **Jimmy She** - *MySQL Database*
* **Vishalkumar Panchal** - *TMDB API*
