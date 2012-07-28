require_relative '../lib/task'

describe Task do
  it "takes a description as argument" do
    task = Task.new "Mowing the lawn"
    task.description.should be == "Mowing the lawn"
  end

  it "has a unique id" do
    task = Task.new "Foobar"
    task.id.should be == "275f60"
  end

  it "is pending once created" do
    task = Task.new "Foobar"
    task.status.should be == :pending
  end

  it "can be finished" do
    task= Task.new "Foobar"
    task.status = :finished
    task.status.should be == :finished
  end
end

