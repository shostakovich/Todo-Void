require_relative "../lib/task"
require_relative "../lib/task_list_view"

describe TaskListView do
  it "displays the started tasks before the pending" do
    pending_task = Task.new "Task1"

    started_task = Task.new "Task2" 
    started_task.status = :started

    view = TaskListView.new([pending_task, started_task])
    view.render.should =~ /#{started_task.id}.*#{pending_task.id}/m
  end

  it "displays the pending tasks before the finished" do
    finished_task = Task.new "Task1"
    finished_task.status = :finished

    pending_task = Task.new "Task2"
    
    view = TaskListView.new([finished_task, pending_task])
    view.render.should =~ /#{pending_task.id}.*#{finished_task.id}/m
  end
end
