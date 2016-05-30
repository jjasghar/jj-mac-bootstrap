#
# Cookbook Name:: jj-mac-bootstrap
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

git "/Users/jjasghar/.emacs.d" do
  repository "https://github.com/jjasghar/.emacs.d.git"
  reference "master"
  user "jjasghar"
  group "staff"
  action :sync
end
