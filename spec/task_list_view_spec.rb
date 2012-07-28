require_relative "../lib/task"
require_relative "../lib/task_list_view"

describe TaskListView do
  it "displays the pending tasks before the finished" do
    task1 = Task.new "Task1"
    task1.status = :finished

    task2 = Task.new "Task2"
    
    task3 = Task.new "Task3"
    task3.status = :finished

    view = TaskListView.new([task1, task2, task3])
    view.render.should =~ /#{task2.id}.*#{task1.id}.*#{task3.id}/m
  end
end
