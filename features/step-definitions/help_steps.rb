When /^I provide the option "\-\-help$/ do
  @output = TaskVoid.execute(["--help"])
end

Then /^I should get help on how to use the program$/ do
  @output.should =~ /-f ID to finish a task/
end
