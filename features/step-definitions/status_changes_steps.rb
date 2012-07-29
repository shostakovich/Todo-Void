When /^I provide the option "(.*?)" plus the hash of a todo$/ do |option|
  TodoVoid.execute([option, "cab959"])
end

When /^I provide the opion "(.*?)" plus the partial hash of a todo$/ do |option|
  TodoVoid.execute([option, "ca"])
end

Then "this todo should be deleted" do
  output = TodoVoid.execute([])
  output.should_not =~  /cab959/
end

Then "this todo should be marked finished" do
  output = TodoVoid.execute([])
  output.should =~ /\e\[30mcab959 todo1/
end

Then "this todo should be marked current" do
  output = TodoVoid.execute([])
  output.should =~ /\e\[32mcab959/
end
