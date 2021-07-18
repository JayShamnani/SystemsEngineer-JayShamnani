#!/bin/bash

usage="./setup.bash - A simple script to run Wordpress and MySQL on Containers
   
   Usage:   ./setup.bash [OPTIONS] [ARGUMENTS]

   OPTIONS:

      start:
         This command will start containers.
         This command requires arguments.
         
         EXAMPLE:
            ./setup.bash start -d 'example.com'

      stop:
         This command will stop all the containers.
         Using this command will not delete containers or kill containers.
         All site data will be saved.
         
         EXAMPLE:
            ./setup.bash stop
      
      delete:
         This command will deletes all containers.
         All site data will lost!!
         
         EXAMPLE:
            ./setup.bash delete

      ./setup.bash --help
         This command will help you


   ARGUMENTS:
      -d  set the domain name (default: 'example.com')

   This is a LEMP stack running in containers. To run this script,
   docker is required. If docker is not installed, then this script
   will automatically install and its required packages. There are 
   3 containers. They are,

   1. Nginx
   2. Wordpress
   3. MySQL
   
   For more advanced info https://github.com/JayShamnani/SystemsEngineer-JayShamnani"

domain="example.com"

# check if docker is installed or not
docker -v > /dev/null 2>&1

if [ $? -gt 0 ]; 

   then
   echo "Looks like docker is not installed in this system"
   echo "Installing Docker..."

   # Installing Docker in system
   ./https://get.docker.com/

   # Assuming docker is installed
   
   else
      
      # check if docker-compose is installed or not
      docker-compose -v > /dev/null 2>&1

      if [ $? -gt 0 ]; 

         then
         echo "Looks like docker is not installed in this system"
         sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
         sudo chmod +x /usr/local/bin/docker-compose

      else

         if [ $# -lt 1 ]
            then
            echo "$usage"

         elif [ $1 == start ]
            then
            if [ $# -lt 2 ]
               then
               echo $#
            else
               if [ $2 == "-d" ]
                  then
                  if [ $# -lt 3 ]
                     then
                     echo "Please provide a domain name"
                  fi
                  else
                  echo "Invalid Option $2"
               fi
            fi
            # docker-compose up -d

         elif [ $1 == stop ]
            then
            docker-compose stop

         elif [ $1 == delete ]
            then
            docker-compose down

         elif [ $1 == describe ]
            then
            docker-compose ps

      fi

   fi

fi