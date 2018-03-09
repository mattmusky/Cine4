# 🎥 Cine4
Web app enabling users to discover, save and share movie lists with friends.

## Installation Steps

25 simple steps for installing on a four server architecture:

### Web Server (10.0.0.10)
1. Install dependencies
```
apt-get install apache2 php7.0 git
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


### RabbitMQ Server (10.0.0.11)
1. Install dependencies
```
sudo apt-get install php7.0 php-amqp rabbitmq-server git
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
rabbitmqadmin -q import ~/cine4/config/rabbitMQ_config.json
```
##### Run Server PHP
```
php ~/cine4/src/logServer.php &
```

### Database Server (10.0.0.12)
1. Install dependencies
```
apt-get install php7.0 php-amqp php7.0-mysql mysql-server git
```
2. Clone project repository to home folder
```
git clone https://github.com/mattmusky/cine4 ~/
```
3. Create symlink to PHP amqp.ini for CLI
```
sudo ln -s /etc/php/mods-available/amqp.ini /etc/php/7.0/cli/conf.d
```
##### Configure MySQL
  + Create User: cine4, Password: infinity
  + Create Database: cine4
  + Run ~/cine4/config/cine4.sql

  ##### Run Server PHP
```
php ~/cine4/src/dataServer.php &
```
```
php ~/cine4/src/authServer.php &
```

### DMZ/API Server (10.0.0.13)
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
##### Run Server PHP
```
php ~/cine4/src/apiServer.php &
```

### Final Step!
Once all four PHP server files are running, navigate to http://10.0.0.10 and login!


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
