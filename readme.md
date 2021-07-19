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

## Screen Shots

<div>

<img src="https://github.com/JayShamnani/SystemsEngineer-JayShamnani/blob/master/screenshots/help1.jpeg?raw=true" width="100">

<img src="https://github.com/JayShamnani/SystemsEngineer-JayShamnani/blob/master/screenshots/help2.jpeg?raw=true" width="100">

<img src="https://github.com/JayShamnani/SystemsEngineer-JayShamnani/blob/master/screenshots/commands.jpeg?raw=true" width="100">


</div>