require_relative "./task_list"
require_relative './task'

class TaskStore
  def read 
    file = File.new('/tmp/tasks', 'r')
    task_list = TaskList.new 
    
    raw_tasks = file.readlines
    file.close

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
    file = File.new('/tmp/tasks', 'w')

    tasks = list.tasks
    tasks.each do |id, task|
      file.write("#{task.status}||#{task.description}\n")
    end
    
    file.close
  end
end
