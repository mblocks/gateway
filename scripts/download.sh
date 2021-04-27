#!/bin/bash


wget $(wget https://api.github.com/repos/$1/releases/latest -q -O - | grep 'dist.zip' | cut -d\" -f4  | cut -d$'\n' -f2) -O $2.zip && unzip -j $2.zip -d /usr/local/openresty/nginx/html/$2
rm $2.zip
