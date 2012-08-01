When /^I provide the option "(.*?)" plus the hash of a todo$/ do |option|
  TodoVoid.execute([option, "cab959"])
end

When /^I provide the opion "(.*?)" plus the partial hash of a todo$/ do |option|
  TodoVoid.execute([option, "ca"])
end

When /I provide the option "(.*?)" and a conflicting partial hash/ do |option|
  @output = TodoVoid.execute([option, "18"])
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

Then "I should see an error message" do
  @output.should =~ /Conflicting part of an id provided please be more specific/
end

Then "I should see the list of alternatives" do
  @output.should =~ /todo3/
end
