require_relative "./task_list"
require_relative './task'

class TaskStore
  def read 
    file = File.new('/tmp/tasks', 'r')
    task_list = TaskList.new 
    
    raw_tasks = file.readlines
    file.close

    raw_tasks.each do |line|
      description = line.gsub("\n", "")
      task = Task.new(description)
      task_list.add task
    end
    task_list
  end

  def save(list)
    file = File.new('/tmp/tasks', 'w')

    tasks = list.tasks
    tasks.each do |task|
      file.write("#{task.description}\n")
    end
    
    file.close
  end
end
