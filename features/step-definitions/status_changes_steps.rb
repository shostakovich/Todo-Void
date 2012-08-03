When /^I provide the option "(.*?)" plus the hash of a todo$/ do |option|
  TodoVoid.new([option, "cab959"]).execute
end

When /^I provide the opion "(.*?)" plus the partial hash of a todo$/ do |option|
  TodoVoid.new([option, "ca"]).execute
end

When /I provide the option "(.*?)" and a conflicting partial hash/ do |option|
  @output = TodoVoid.new([option, "18"]).execute
end

When /^I provide the option "(.*?)" and a non\-existent hash$/ do |option|
  @output = TodoVoid.new([option, "foobar"]).execute
end

Then "this todo should be deleted" do
  output = TodoVoid.new.execute
  output.should_not =~  /cab959/
end

Then "this todo should be marked finished" do
  output = TodoVoid.new.execute
  output.should =~ /\e\[30mcab959 todo1/
end

Then "this todo should be marked current" do
  output = TodoVoid.new.execute
  output.should =~ /\e\[32mcab959/
end

Then "I should be notified about a conflict" do
  @output.should =~ /Conflicting part of an id provided please be more specific/
end

Then /^I should be notified about the erronious hash$/ do
  @output.should =~ /There is no todo with matching id/
end

Then "I should see the list of alternatives" do
  @output.should =~ /todo3/
end
