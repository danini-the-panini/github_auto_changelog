#!/usr/bin/env ruby

require 'dotenv/load'
require 'octokit'

REPO = ENV['GITHUB_REPO']

client = Octokit::Client.new(access_token: ENV['GITHUB_USER_TOKEN'])

milestones = client.list_milestones(REPO, state: 'all', sort: 'created', direction: 'desc')
milestones.each do |m|
  puts "#{m[:number]}: #{m[:title]} (#{m[:state]})"
end

mnum = nil
begin
  print "Which milestone? "
  mnum = gets.chomp.to_i
end until milestones.map{|m|m[:number]}.include?(mnum)

issues = client.list_issues(REPO, milestone: mnum, state: 'all', sort: 'created', direction: 'asc')
issues.each do |i|
  puts "- #{i[:title]}"
end
