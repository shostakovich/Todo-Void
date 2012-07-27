#!/usr/bin/env ruby
require 'openssl'
require_relative './interactors/task_interactor.rb'

if ARGV[0] == "-d"
  TaskInteractor.new.delete_task(ARGV[1])
elsif(ARGV[0])
  TaskInteractor.new.add_task(ARGV[0])
else
  tasks = TaskInteractor.new.list_all
  tasks.each do |task| 
    puts "#{task.id} #{task.description}"
  end
end
