require_relative '../../lib/task_void'

class TaskStore
  private
  def task_file
    '/tmp/tasks'
  end
end

Given /^An empty task list$/ do
  system 'rm /tmp/tasks'
  system 'touch /tmp/tasks'
end

When /^I add a task$/ do
  @task_name = "Mowing lawn"
  TaskVoid.execute([@task_name])
end

Then /^the task should appear in the list of tasks$/ do
  output = TaskVoid.execute([])
  output.should =~/#{@task_name}/
end
