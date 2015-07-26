#!/bin/sh

BASEDIR=$(dirname $0)

install_rvm () {
    RVMKEY="409B6B1796C275462A1703113804BB82D39DC0E3"
    gpg -k "$RVMKEY" >/dev/null 2>&1 || gpg --keyserver hkp://keys.gnupg.net --recv-keys $RVMKEY
    curl -sSL https://get.rvm.io | bash -s stable --ruby
}

which rvm >/dev/null 2>&1 || install_rvm

. $HOME/.rvm/scripts/rvm
rvm gemset create global
rvm use @global
gem install bundler
GEMSET=$(cat "$BASEDIR/.ruby-gemset")
rvm gemset create $GEMSET
rvm use @$GEMSET
bundler install
