Given /^An empty task list$/ do
  system 'rm /tmp/tasks'
  system 'touch /tmp/tasks'
end

When /^I add a task$/ do
  @task_name = "Mowing lawn"
  add_task(@task_name)
end

Then /^the task should appear in the list of tasks$/ do
  @output = %x[/Users/shostakovich/Ruby/task-void/task.rb]
  @output.should =~/#{@task_name}/
end
