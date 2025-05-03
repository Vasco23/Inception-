#!/bin/bash

if [ ! -d /run/mysqld ]
then
	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql
fi

if [ ! -f /init.sql ]; then
    if [ -f /init.template.sql ]; then
        echo "Creating init.sql from init.template.sql..."
        envsubst < /init.template.sql > /init.sql
        mysqld --user=mysql --bootstrap < /init.sql
    else
        echo "init.template.sql not found, skipping database initialization."
    fi
fi

exec mysqld --user=mysql --console