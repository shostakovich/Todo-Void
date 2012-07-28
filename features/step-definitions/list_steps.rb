require_relative '../../interactors/task_interactor'
require_relative '../../lib/task_void'

def add_task(task)
  TaskInteractor.new.add_task(task)
end

def clean_tasks
  system "rm /tmp/tasks"
  system "touch /tmp/tasks"
end

Given /^I added tasks$/ do
  clean_tasks
  add_task "Task1"
  add_task "Task2"
  add_task "Task3"
end

When /^I run the task command$/ do
  @output = TaskVoid.execute([])
end

Then /^I should see a list of tasks$/ do
  @output.should =~ /Task1/
  @output.should =~ /Task2/
  @output.should =~ /Task3/
end

Then /^every task should have a unique number in front of it$/ do
  @output.should =~ /d7cec7/
end
