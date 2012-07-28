When /^I provide the option "(.*?)" plus the hash of a task$/ do |option|
  TaskVoid.execute([option, "d7cec7"])
end

When /^I provide the opion "(.*?)" plus the partial hash of a task$/ do |option|
  TaskVoid.execute([option, "d7"])
end

Then "this task should be deleted" do
  output = TaskVoid.execute([])
  output.should_not =~  /d7cec7/
end

Then "this task should be marked finished" do
  output = TaskVoid.execute([])
  output.should =~ /\e\[30md7cec7 Task1/
end

