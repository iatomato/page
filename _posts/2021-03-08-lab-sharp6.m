# Apache2 Configuration

#ServerRoot "/etc/apache2"
#Mutex file:${APACHE_LOCK_DIR} default
DefaultRuntimeDir ${APACHE_RUN_DIR}
PidFile ${APACHE_PID_FILE}
Timeout 300
KeepAlive On
MaxKeepAliveRequests 100
KeepAliveTimeout 5
User ${APACHE_RUN_USER}
Group ${APACHE_RUN_GROUP}
HostnameLookups Off
ErrorLog ${APACHE_LOG_DIR}/error.log
LogLevel warn
IncludeOptional mods-enabled/*.load
IncludeOptional mods-enabled/*.conf
Include ports.conf
<Directory />
	AllowOverride None
	Require all granted
</Directory>

<Directory /usr/share>
	AllowOverride None
	Require all granted
</Directory>

<Directory /var/www/>
	Options Indexes FollowSymLinks
	AllowOverride None
	Require all granted
</Directory>

AccessFileName .htaccess
<FilesMatch "^\.ht">
	Require all denied
</FilesMatch>

LogFormat "%v:%p %h %l %u %t \"%r\" %>s %O \"%{Referer}i\" \"%{User-Agent}i\"" vhost_combined
LogFormat "%h %l %u %t \"%r\" %>s %O \"%{Referer}i\" \"%{User-Agent}i\"" combined
LogFormat "%h %l %u %t \"%r\" %>s %O" common
LogFormat "%{Referer}i -> %U" referer
LogFormat "%{User-agent}i" agent

IncludeOptional conf-enabled/*.conf

IncludeOptional sites-enabled/*.conf

<IfModule dir_module>
	DirectoryIndex index.html index.php
</IfModule>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet

# VritaulHost Configuration


<VirtualHost *:80>
	ServerName www.dev.com
	ServerAdmin <?>
	DocumentRoot /var/www/dev.com

	ErrorLog ${APACHE_LOG_DIR}/master-error.log
	CustomLog ${APACHE_LOG_DIR}/master-access.log combined env=!image_request
	
	SetEnvif Request_URL ".*\.git$" image-request
	SetENvif Request_URL ".*\.jpg$" image_request
	SetEnvif Request_URL ".*\.js$"  image_request
	SetEnvif Request_URL ".*\.css$" image_request

	<IfModule mod_expires.c>
		ExpiresActive on
		ExpiresByType image/jpg "access plus 1 days"
		ExpiresByType image/png "access plus 1 days"
		ExpiresByType application/x-javascript "now plus 2 hours"
		ExpiresByType application/javascript   "now plus 2 hours"
	</IfModule>

	<filesmatch "\.(txt|doc|mp3|zip|rar|jpg|pdf|jpg|gif)">
		Order Allow,Deny
		Allow from env=loacl_ref
	</filesmatch>

</VirtualHost>

<VirtualHost *:80>
	DocumentRoot /var/www/dev.org
	ServerName www.dev.org
	ErrorLog ${APACHE_LOG_DIR}/s-error.log
	CustomLog ${APACHE_LOG_DIR}/s-access.log comined
</VirtualHost>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet

# Enable Exirpes Module

LoadModule expires_module /usr/lib/apache2/modules/mod_expires.so

# PHP Configuration

<FilesMatch ".+\.ph(ar|p|tml)$">
    SetHandler application/x-httpd-php
</FilesMatch>
<FilesMatch ".+\.phps$">
    SetHandler application/x-httpd-php-source
    # Deny access to raw php sources by default
    # To re-enable it's recommended to enable access to the files
    # only in specific virtual host or directory
    Require all denied
</FilesMatch>
# Deny access to files without filename (e.g. '.php')
<FilesMatch "^\.ph(ar|p|ps|tml)$">
    Require all denied
</FilesMatch>

<IfModule mod_userdir.c>
    <Directory /home/*/public_html>
        php_admin_flag engine Off
    </Directory>
</IfModule>
