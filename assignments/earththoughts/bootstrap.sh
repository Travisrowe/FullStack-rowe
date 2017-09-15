#!/usr/bin/env bash
if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant /var/www
fi
apt-get update
    apt-get install -y apache2
    apt-get install -y curl
    echo "#!/bin/bash
    function InstallPip {
      if [ '$(which pip)' ]; then
        echo '-- Already installed.'
        return
      fi
      apt-get install python-dev python-setuptools -y -qq
      apt-get install -y python-pip
      pip install --upgrade pip
      apt-get install -y mongodb
      apt-get install -y python-pymongo
      apt-get install -y python-bson
    }
    echo 'Installing Pip...'; InstallPip
    echo 'Installing Flask...'; pip install flask
    echo 'Installing requests...'; pip install requests
	pip install flask_cors
    exit 0" | /bin/bash

