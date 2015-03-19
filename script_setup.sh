#!/bin/sh


stow emacs;
stow bash;
stow tmux;
pushd ../.emacs;
wget http://www.emacswiki.org/emacs/download/column-marker.el;
popd;
