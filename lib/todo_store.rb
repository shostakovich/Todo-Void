require_relative "./todo_list"
require_relative './todo'
require 'fileutils'
require 'csv'

class TodoStore
  def initialize
    read
  end

  def todos
    @list
  end

  def update(todo)
    @list.update(todo)
    write
  end

  def save(todo)
    @list.add(todo)
    write
  end

  private
  def read
    @list = TodoList.new
    
    data = CSV.read(todo_file)
    data.each do |raw_todo|
      todo = Todo.new raw_todo[0]
      todo.status = raw_todo[1].to_sym
      @list.add todo
    end
  end
  
  def write
    CSV.open(todo_file, "w") do |csv|
      @list.to_array.each do |task|
        csv << [task.description, task.status]
      end
    end
  end

  def todo_file
    Dir.home + '/.todos'
  end
end
