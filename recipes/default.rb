#
# Cookbook Name:: jj-mac-bootstrap
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

home = '/Users/jjasghar'

# Get my .emacs.d directory there
git "#{home}/.emacs.d" do
  repository "https://github.com/jjasghar/.emacs.d.git"
  reference "master"
  user "jjasghar"
  group "staff"
  action :checkout
end

# link up my org files
link "#{home}/org" do
  to "#{home}/Dropbox/org"
end

# link up my docs to org
link "#{home}/docs" do
  to "#{home}/Dropbox/org"
end

# link up my .tmux to ~
link "#{home}/.tmux.conf" do
  to "#{home}/Dropbox/configs/tmux.conf"
end

# link up my .bashrc to ~
link "#{home}/.bashrc" do
  to "#{home}/Dropbox/configs/bashrc"
end

# link up my .bash_aliases to ~
link "#{home}/.bash_aliases" do
  to "#{home}/Dropbox/configs/bash_aliases"
end

# link up my .bash_profile to .bashrc
link "#{home}/.bashrc" do
  to "#{home}/.bash_profile"
end

# let set up rvm because well, i'm lazy
bash "install rvm" do
  user "jjasghar"
  cwd "#{home}"
  creates "#{home}/.rvm"
  code <<-EOH
    STATUS=0
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 || STATUS=1
    curl -sSL https://get.rvm.io | bash -s stable --ruby=2.2.0 || STATUS=1
    exit $STATUS
  EOH
end
