require_relative "./todo_list"
require_relative './todo'
require 'fileutils'

class TodoStore
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

    todo_list
  end

  def save(list)
    seriaized_todos = ""
    todos = list.todo
    todos.each do |id, todo|
      seriaized_todos += "#{todo.status}||#{todo.description}\n"
    end

    File.write(todo_file, seriaized_todos)
  end

  private
  def todo_file
    Dir.home + '/.todos'
  end
end