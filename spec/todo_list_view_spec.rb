require_relative "../lib/todo"
require_relative "../lib/todo_list_view"

describe TodoListView do
  it "displays the started todos before the pending" do
    pending_todo = Todo.new "Todo1"

    started_todo = Todo.new "Todo2"
    started_todo.status = :started

    view = TodoListView.new([pending_todo, started_todo])
    view.render.should =~ /#{started_todo.id}.*#{pending_todo.id}/m
  end

  it "displays the pending todos before the finished" do
    finished_todo = Todo.new "Todo1"
    finished_todo.status = :finished

    pending_todo = Todo.new "Todo2"
    
    view = TodoListView.new([finished_todo, pending_todo])
    view.render.should =~ /#{pending_todo.id}.*#{finished_todo.id}/m
  end
end