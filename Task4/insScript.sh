#! /bin/bash
sudo apt update
sudo apt install -y apache2
cat <<EOF > /var/www/html/index.html
 <html><body><p><h1>LAMP created by Terraform script Vitalii Tkachuk</h1></p></body></html>
EOF
sudo apt install -y mariadb-server
sudo apt install -y php libapache2-mod-php php-mysql
sudo touch /var/www/html/phpinfo.php
cat <<EOF > /var/www/html/phpinfo.php
 <?php phpinfo(); ?>
EOF
sudo service apache2 restart
