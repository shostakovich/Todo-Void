require_relative '../../interactors/todo_interactor'
require_relative '../../lib/todo_void'
require 'timecop'

def add_todo(todo)
  TodoInteractor.new.add_todo(todo)
end

def clean_todos
  system "rm /tmp/todos"
  system "touch /tmp/todos"
end

Given "I added todos" do
  clean_todos
  add_todo "todo1"
  add_todo "todo2"
  add_todo "todo3"
  add_todo "todo311013" # First 2 chars of ids are the same as todo3"
end

When "I run the todo command" do
  @output = TodoVoid.new.execute
end

Then "I should see a list of todos" do
  @output.should =~ /todo1/
  @output.should =~ /todo2/
  @output.should =~ /todo3/
end

Then "every todo should have a unique number in front of it" do
  @output.should =~ /cab959/
end

When /^I finish a todo$/ do
  TodoVoid.new(["-f", "cab"]).execute
end

When /^I run the command the next day$/ do
 Timecop.freeze(Time.now + 86401) do
    @output = TodoVoid.new.execute
  end
end

Then /^I should see not see the finished todo$/ do
  @output.should_not =~ /cab959/
end
