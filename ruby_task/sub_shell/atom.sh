#!/bin/bash

mkdir -p ~/.atom/
# https://superuser.com/questions/61611/how-to-copy-with-cp-to-include-hidden-files-and-hidden-directories-and-their-con
cp -r ../bin/atom/config/. ~/.atom
