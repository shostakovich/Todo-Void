When /^I provide the option "\-\-help$/ do
  @output = TodoVoid.new(["--help"]).execute
end

Then /^I should get help on how to use the program$/ do
  @output.should =~ /Basic Usage/
end
