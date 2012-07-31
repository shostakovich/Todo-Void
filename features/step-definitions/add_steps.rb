require 'require_relative'
require_relative '../../lib/todo_void'

class TodoStore
  private
  def todo_file
    '/tmp/todos'
  end
end

Given "An empty todo list" do
  system 'rm /tmp/todos'
  system 'touch /tmp/todos'
end

When "I add a todo" do
  @todo_name = "Mowing lawn"
  TodoVoid.execute([@todo_name])
end

Then "the todo should appear in the list of todos" do
  output = TodoVoid.execute([])
  output.should =~/#{@todo_name}/
end
