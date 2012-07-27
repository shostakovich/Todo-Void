require_relative '../lib/task_list'
require_relative '../lib/task'

describe TaskList do
  let(:list){ TaskList.new }
  let(:task){ Task.new "Mow the lawn" }

  it "accepts new tasks" do
    list.add task
    list.tasks[0].id.should == task.id
  end

  it "can remove tasks" do
    list.remove(task.id)
    list.tasks.length.should == 0
  end
end
