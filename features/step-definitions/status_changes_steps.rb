When 'I provide the option "-d" plus the hash of a task' do
  TaskVoid.execute(["-d", "d7cec7"])
end

Then "this task should be deleted" do
  output = TaskVoid.execute([])
  output.should_not =~  /d7cec7/
end
