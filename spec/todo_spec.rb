require 'require_relative'
require_relative '../lib/todo'

describe Todo do
  it "takes a description as argument" do
    todo = Todo.new "Mowing the lawn"
    todo.description.should be == "Mowing the lawn"
  end

  it "has a unique id" do
    todo = Todo.new "Foobar"
    todo.id.should be == "275f60"
  end

  it "is pending once created" do
    todo = Todo.new "Foobar"
    todo.status.should be == :pending
  end

  it "can be finished" do
    todo= Todo.new "Foobar"
    todo.status = :finished
    todo.status.should be == :finished
  end
end

