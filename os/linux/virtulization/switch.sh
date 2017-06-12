#!/bin/bash

# The script will be used to switch between virtulization
# infras i.e virtual box and kvm

if [[ $EUID -ne 0 ]]; then
    echo "Error: Please run the script with sudo"
    exit 1
fi

function usage {
  echo "Error: Please specify the virtulization platform"
  echo "                                                "
  echo "For example:                                    "
  echo "$0 --kvm                                        "
  echo "or                                              "
  echo "$0 --virtualbox                                 "
  exit 1
}

if [[ $1 = "--virtualbox" ]]; then
  /sbin/rmmod kvm_intel
  /sbin/rmmod kvm
  systemctl start virtualbox
  exit 0
fi

if [[ $1 = "--kvm" ]]; then
  systemctl stop virtualbox
  /sbin/modprobe kvm
  /sbin/modprobe kvm_intel
  exit 0
fi

usage
