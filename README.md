# apache_server
This repo is designed to quickly deploy a PHP-enabled apache sever within an Almalinux docker container. The dockerfile sets environment variables within the container and configures php.ini and httpd.conf to access the container's environment variables.

# Empty Directories
The compose.yaml file is configured to bind a volume mount from the html/ directory within the repo to the /var/www/html/ directory within the docker container. The idea is to clone a web root into this directory from a separate repo, which means html/ has to be empty. Since git doesn't support committing empty directories, remember to create the html/ directory after cloning. .gitignore is already configred to ignore this directory.
<!-- High-level description -->
<!-- Instruction to create HTML directory -->

# Connections Config
The dockerfile sets the php_connections_ini environment variable to point to /etc/connections.ini. This file is meant to store API keys and other access credentials, so it isn't (and should not be) included in version control. Remember to create or copy a connectiosn.ini file to this location. Below is an example of how to enter credeentials into your connections.ini file:

```ini
[NAME_OF_DATASOURCE]
Username = credentials_username
Password = credentials_password
Type = datasource_type
```