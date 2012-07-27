When 'I provide the option "-d" plus the hash of a task' do
  system "/Users/shostakovich/Ruby/task-void/task.rb -d d7cec7"
end

Then "this task should be deleted" do
  output = %x[/Users/shostakovich/Ruby/task-void/task.rb]
  output.should_not =~  /d7cec7 Task1/
end
