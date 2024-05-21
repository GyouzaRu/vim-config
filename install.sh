#!/usr/bin/env bash

CURR_DIR=$(cd `dirname $0`; pwd)
cd ${CURR_DIR}

curl -fLo ./autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -sfn ${CURR_DIR} ~/.vim

cd -
