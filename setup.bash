#!/bin/bash

usage="./setup.bash - A simple script to run Wordpress and MySQL on Containers
   
   Usage:   ./setup.bash [OPTIONS] [ARGUMENTS]

   OPTIONS:

      start:
         This command will start containers.
         This command requires arguments (but not mandatory).
         
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

export CUSTOM_DOMAIN="example.com"

# check if docker is installed or not
docker -v > /dev/null 2>&1
export IS_DOCKER_PRESENT=$?

docker-compose > /dev/null 2>&1
export IS_DOCKER_COMPOSE_PRESENT=$?

if [ $IS_DOCKER_PRESENT -ge 1 ]; 

   then
   if [ $DOCKER_INSTALL_RESULT -ge 1 ] > /dev/null 2>&1
   
   then
   
      echo "Tried to install docker but failed durning installation."
      echo "Trying Installing docker and docker compose manually."
   
   else

      echo "Looks like docker is not installed in this system"
      echo "Installing Docker..."
      
      # Installing Docker
      curl -fsSL get.docker.com -o get-docker.sh
      sudo sh get-docker.sh > /dev/null 2>&1
      export DOCKER_INSTALL_RESULT=$?
      
      # Installing Docker Compose
      sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose > /dev/null 2>&1
      sudo chmod +x /usr/local/bin/docker-compose > /dev/null 2>&1
      export DOCKER_COMPOSE_INSTALL_RESULT=$?
   
      # If all the setup are done then the further script will execute
      ./setup.bash

   fi

elif [ $IS_DOCKER_COMPOSE_PRESENT -ge 1 ]
   
   then
   
   if [ $DOCKER_COMPOSE_INSTALL_RESULT -ge 1 ] > /dev/null 2>&1
   
   then
   
      echo "Script tried to install docker but failed durning installation"
      echo "trying Installing docker and docker compose manually"
   
   else

      echo "Looks like docker is not installed in this system"
      echo "Installing Docker..."

      sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose > /dev/null 2>&1
      sudo chmod +x /usr/local/bin/docker-compose > /dev/null 2>&1
      export DOCKER_COMPOSE_INSTALL_RESULT=$?
      ./setup.bash

   fi

else

      if [ $# -lt 1 ]
         then
         echo "$usage"

      elif [ $1 == start ]
         then
         if [ $# -lt 2 ]
            then
            echo "Domain name not provided..."
            echo "Taking default domain name 'example.com'"
            # export DOMAIN="example.com"
            docker-compose up -d
            if [ $? -gt 0 ]
               then
               echo "Error Occurred"
               else
               echo "Open $CUSTOM_DOMAIN in your browser"
            fi
         else
            if [ $2 == "-d" ]
               then
               if [ $# -lt 3 ]
                  then
                  echo "Please provide a domain name"
                  else
                  export CUSTOM_DOMAIN=$3
                  echo "Domain name provided... $CUSTOM_DOMAIN"
                  docker-compose up -d
                  if [ $? -gt 0 ]
                     then
                     echo "Error Occurred"
                     else
                     echo "Open $CUSTOM_DOMAIN in your browser"
                  fi
               fi
            else
            echo "Invalid Option $2"
            fi
         fi

      elif [ $1 == stop ]
         then
         docker-compose stop

      elif [ $1 == delete ]
         then
         docker-compose down

      elif [ $1 == describe ]
         then
         docker-compose ps

      elif [ $1 == '--help' ]
         then
         ./setup.bash
      
      else
         echo "Invalid Option"

   fi

fi
