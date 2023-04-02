#!/bin/bash

function print_header() {
    local text=$1
    local blue=$(tput setaf 4)
    local normal=$(tput sgr0)

    echo "${blue}${text}${normal}"
}

function check_error() {
  if [ $? -eq 0 ]; then
    print_header "-- Install $1: success!"
  else
    print_header "-- Install $1: fail!"
    print_header "-- Exit!"
    exit 1
  fi
}
