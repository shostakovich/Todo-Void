require 'require_relative'
require_relative '../lib/todo_list'
require_relative '../lib/todo'

describe TodoList do
  let(:list){ TodoList.new }
  let(:todo){ Todo.new "Mow the lawn" }

  it "accepts a todo" do
    list.add todo
    list.todo[todo.id].should be == todo
  end

  it "can convert into an array" do
    list.add todo
    list.to_array.class.should == Array
  end

  it "has a length" do
    list.add todo
    list.length.should == 1
  end

  it "is empty if no tasks are inside" do
    list.empty?.should == true
  end

  it "can update a task" do
    list.add todo
    todo.status = :test
    list.update(todo)
    list.todo[todo.id].status.should == :test
  end

  it "finds a todo by its full hash" do
    list.add todo
    result = list.find(todo.id)
    result.todo[todo.id].should == todo
  end

  it "finds a todo by a part of the hash" do
    list.add todo
    result = list.find(todo.id.slice(0..2))
    result.todo[todo.id].should == todo
  end

  it "prevents duplication of todos" do
    list.add todo
    list.add todo
    list.todo.length.should == 1
  end
end
