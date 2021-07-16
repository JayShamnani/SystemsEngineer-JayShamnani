#!/bin/bash

usage="A simple script to run Wordpress and MySQL on Containers

where:
    -h  show help text
    -d  set the domain name (default: 'example.com')"

domain="example.com"

if [ $# -lt 1 ]
then
echo "$usage"
fi

while getopts ':hd:' option; do
  case "$option" in
    h) echo "$usage"
       exit
       ;;
    d) domain=$OPTARG
        echo "Your domain name is: "$domain
       ;;
    :) printf "missing argument for -%s\t\n
    \033[32;1m OK \033[0m\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
   \?) printf "illegal option: -%s\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
    *) printf "illegal option: -%s\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
  esac
done
shift $((OPTIND - 1))