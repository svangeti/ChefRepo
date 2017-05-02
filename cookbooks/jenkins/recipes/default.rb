#
# Cookbook Name:: jenkins
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "apt"

package 'nginx' do
   action :install
end

service 'nginx' do
	action [ :enable, :start ]
end


apt_repository "jenkins" do
uri "http://pkg.jenkins.io/debian-stable"
  key "https://pkg.jenkins.io/debian/jenkins.io.key"
  components ["binary/"]
  action :add
end

package "jenkins"

service "jenkins" do
  supports [:stop, :start, :restart]
  action [:start, :enable]
end
