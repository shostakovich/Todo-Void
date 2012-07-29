require_relative "./task_list"
require_relative './task'
require 'fileutils'

class TaskStore
  def read 
    task_list = TaskList.new 

    FileUtils.touch(task_file)
    raw_tasks = File.readlines(task_file)

    raw_tasks.each do |line|
      line = line.gsub("\n", "")
      status, description = line.split "||"
      task = Task.new(description)
      task.status = status.to_sym
      task_list.add task
    end

    task_list
  end

  def save(list)
    serialized_tasks = ""
    tasks = list.tasks
    tasks.each do |id, task|
      serialized_tasks += "#{task.status}||#{task.description}\n"
    end

    File.write(task_file, serialized_tasks)
  end

  private
  def task_file
    Dir.home + '/.tasks'
  end
end
