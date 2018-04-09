#!/bin/sh
#==========================================================================#
#   System Required:  CentOS 6+                                            #
#   Description:  Yum Install LAMP(Linux + Apache + MySQL + PHP )          #
#==========================================================================#


echo -e "update packages"
yum update
echo -e "update completed!"

echo -e "Installing Apache"
yum -y install httpd
chkconfig httpd on
mkdir -p /data/www/html
chown -R apache:apache /data/www/html
service httpd start
echo "Apache Install completed!"

echo -e "Installing mysql"
yum -y install mysql mysql-server
chkconfig mysqld on
service mysqld start

rootpass = "nguyenchan"
mysql -u root <<-EOF
UPDATE mysql.user SET Password=PASSWORD('$rootpass') WHERE User='root';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.db WHERE Db='test' OR Db='test_%';
FLUSH PRIVILEGES;
EOF


echo "Start Installing PHP..."
yum -y install php
yum -y install php-mysqlphp-gd php-imap php-ldap php-odbc php-pear php-xml php-xmlrpc php-mbstring php-mcryptphp-mssql php-snmp php-soap php-tidy curl curl-devel php-pecl-apc
/etc/init.d/httpd restart

cat > /var/www/html/info.php<<EOF
<?php
phpinfo();
?>
EOF


echo -e "Install phpmyadmin"
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY*
yum -y install epel-release
yum -y install phpmyadmin
sed -i '/<Directory "/usr/share/phpmyadmin">/,/</Directory>/c\
#<Directory "/usr/share/phpmyadmin">\
#  Order Deny,Allow\
#  Deny from all\
#  Allow from 127.0.0.1\
#</Directory>' /etc/httpd/conf.d/phpMyAdmin.conf

/etc/init.d/httpd restart