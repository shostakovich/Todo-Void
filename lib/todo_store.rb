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
    FileUtils.touch(todo_file)
    data = CSV.read(todo_file)
    todos = data.map do |raw_todo|
      convert_raw_todo(raw_todo)
    end
    @list = TodoList.new(todos)
  end
 
  def convert_raw_todo(raw_todo)
    todo = Todo.new raw_todo[0]
    unless raw_todo[2].nil?
      todo.finished_at =  DateTime.parse(raw_todo[2]).to_time
    end
    todo.status = raw_todo[1].to_sym
    todo
  end

  def write
    CSV.open(todo_file, "w") do |csv|
      @list.each do |todo|
        csv << [todo.description, todo.status, todo.finished_at]
      end
    end
  end

  def todo_file
    Dir.home + '/.todos'
  end
end
