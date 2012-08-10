require_relative './spec_helper'
require_relative '../lib/todo'
require 'timecop'

describe Todo do
  it "takes a description as argument" do
    todo = Todo.new "Mowing the lawn"
    todo.description.should be == "Mowing the lawn"
  end

  it "has a unique id" do
    todo = Todo.new "Foobar"
    todo.id.should be == "275f60"
  end

  it "can have tags" do
    todo = Todo.new "Foobar"
    todo.tags = ['a', 'b']
    todo.tags.should == ['a', 'b']
  end

  it "is pending once created" do
    todo = Todo.new "Foobar"
    todo.status.should be == :pending
  end

  context "that is not finished" do
    it "can be finished" do
      todo= Todo.new "Foobar"
      todo.status = :finished
      todo.status.should be == :finished
    end

    it "creates a timestamp when it was finished" do
      todo  = Todo.new "Foo"
      Timecop.freeze do
        todo.status = :finished
        todo.finished_at.should == Time.now
      end
    end
  end
end

