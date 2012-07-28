require_relative '../lib/task_list'
require_relative '../lib/task'

describe TaskList do
  let(:list){ TaskList.new }
  let(:task){ Task.new "Mow the lawn" }

  it "accepts new tasks" do
    list.add task
    list.tasks[task.id].should be == task
  end

  it "can remove tasks" do
    list.add task
    list.remove(task.id)
    list.tasks.length.should == 0
  end

  it "can find a task" do
    list.add task
    list.find(task.id).should == task
  end

  it "does not take duplicate tasks" do
    list.add task
    list.add task
    list.tasks.length.should == 1
  end
end
