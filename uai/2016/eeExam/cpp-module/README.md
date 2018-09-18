## System Requirements

Linux platform with installed g++ and MySQL for database testing. For Debian/Ubuntu, you can install mysql-server and mysql-client.

	$ sudo apt-get install mysql-server mysql-client

You also need MySQL Development library, libmysqlcppconn-dev.

	$ sudo apt-get install libmysqlcppconn-dev

## Database

For database testing, you can run database.sql script to execute database and table.

## Compiling 

You can compile use make.

    $ cd src/
    $ make app