require_relative "./todo_list"
require_relative './todo'
require 'fileutils'

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
    todo_list = TodoList.new

    FileUtils.touch(todo_file)
    file_content = File.readlines(todo_file)

    file_content.each do |line|
      line = line.gsub("\n", "")
      status, description = line.split "||"
      todo = Todo.new(description)
      todo.status = status.to_sym
      todo_list.add todo
    end

    @list = todo_list
  end

  def write
    serialized_todos = ""
    
    todos = @list.todo
    todos.each do |id, todo|
      serialized_todos += "#{todo.status}||#{todo.description}\n"
    end

    File.open(todo_file, "w") {|f| f.write serialized_todos }
  end

  def todo_file
    Dir.home + '/.todos'
  end
end
