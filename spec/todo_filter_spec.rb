require_relative './spec_helper'
require_relative '../lib/todo'
require_relative '../lib/todo_filter'

describe TodoFilter do
  let(:pending_todo){ Todo.new("Mow the lawn") }
  let(:started_todo) do 
    todo = Todo.new "Started"
    todo.status = :started
    todo
  end

  it "filters deleted todos per default" do
    deleted_todo = Todo.new "Test2"
    deleted_todo.status = :deleted

    filter = TodoFilter.new([pending_todo, deleted_todo])
    filter.execute.should == TodoList.new([pending_todo])
  end

  it "can filter by many statuses" do
    finished_todo = Todo.new("Finished")
    finished_todo.status = :finished

    filter = TodoFilter.new([started_todo, finished_todo, pending_todo])
    todos = filter.with_status([:started, :pending]).execute
    todos.should == TodoList.new([started_todo, pending_todo])
  end

  it "can remove todos that have an old finished_at flag" do
    old_todo = Todo.new "Old"
    old_todo.finished_at = Time.now - 86401
    old_todo.status = :finished

    filter = TodoFilter.new([pending_todo, old_todo])
    filter.recent.execute.should  == TodoList.new([pending_todo])
  end

  describe "filter by hash" do
    it "filters todos full hash" do
      filter = TodoFilter.new([pending_todo, started_todo])
      result = filter.with_hash(pending_todo.id).execute
      result.should == TodoList.new([pending_todo])
    end

    it "filters todos partial hash" do
      filter = TodoFilter.new([pending_todo, started_todo])
      result = filter.with_hash(pending_todo.id.slice(0..2)).execute
      result.should == TodoList.new([pending_todo])
    end
  end
end
