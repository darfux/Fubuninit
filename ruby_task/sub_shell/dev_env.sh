#!/bin/bash

if [[ "$1" == "setup" ]]; then
  echo "export RAILS_DEV_MACHINE=1" >> $HOME/.zshrc
fi