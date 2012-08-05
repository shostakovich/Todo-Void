require_relative '../lib/todo'
require_relative '../lib/todo_filter'

describe TodoFilter do
  it "removes deleted todos per default" do
    pending_todo = Todo.new "Test"
    
    deleted_todo = Todo.new "Test2"
    deleted_todo.status = :deleted

    filter = TodoFilter.new([pending_todo, deleted_todo])
    filter.execute.should == [pending_todo]
  end

  it "can filter by many statuses" do
    started_todo = Todo.new("Started")
    started_todo.status = :started
    
    finished_todo = Todo.new("Finished")
    finished_todo.status = :finished
    
    pending_todo = Todo.new("Pending")

    filter = TodoFilter.new([started_todo, finished_todo, pending_todo])
    todos = filter.with_status([:started, :pending]).execute
    todos.should == [started_todo, pending_todo]
  end

  it "can remove todos that have an old finished_at flag" do
    new_todo = Todo.new "New"
    new_todo.status = :finished
    old_todo = Todo.new "Old"
    old_todo.finished_at = Time.now - 86401
    old_todo.status = :finished

    filter = TodoFilter.new([new_todo, old_todo])
    filter.recent.execute.should  == [new_todo]
  end
end
