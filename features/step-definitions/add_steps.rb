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
  app = TodoVoid.new([@todo_name])
  app.execute
end

Then "the todo should appear in the list of todos" do
  output = TodoVoid.new.execute
  output.should =~/#{@todo_name}/
end

When /^I add a todo with a tag$/ do
  TodoVoid.new(["Mowing the lawn", "--tags='apple,iphone'"]).execute
end

Then /^next to it I should see the tag$/ do
  output = TodoVoid.new.execute
  output.should =~ /\(apple, iphone\)/
end
