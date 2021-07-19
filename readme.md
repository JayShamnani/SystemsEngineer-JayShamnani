# SystemsEngineer-JayShamnani
**Bash Script to setup Wordpress (LEMP stack running inside containers)**

This Script will setup and install all the required Components for the LEMP stack.
<br />

## Project setup

This script requires docker and docker-compose. If not found it will automatically install required packages.

This script will only run as superuser
```
sudo su
```
#### to run containers
```
. ./setup.bash start -d 'example.com'
```
#### to stop containers
```
. ./setup.bash stop
```
#### to delete containers and clean up
```
. ./setup.bash delete
```
#### to get help
```
. ./setup.bash
```

## Directory Structure
foo

|--mysql

|--nginx

|--wordpress

## Special Notes

This script is best supported on Ubuntu Linux platforms. Other platforms are supported if Docker and Docker-Compose is available.