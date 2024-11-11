#!/bin/bash

#pypack
#by ocueye2

version="3.12"
program="start.py"

# check if venv exists (to see if script has run before)
if [[ -f "pypack/.venv/env/bin/activate" ]]
then
    echo "starting"
else
    echo "installing"
cd pypack
sudo apt update

# install requirements
if ! command -v "python$version" &> /dev/null
then
    sudo apt-get install "python$version"
fi


    # make a venv
    mkdir .venv
    cd .venv
    "python$version" -m venv env
    source env/bin/activate
    cd ..
    pip install -r requirements.txt
    cd ..
    deactivate
fi
source pypack/.venv/env/bin/activate
python "$program"
