require_relative '../lib/task_store'
require_relative '../lib/task'

describe TaskStore do
  before do
    system "rm /tmp/tasks"
    system "touch /tmp/tasks"
  end

  let(:store){ TaskStore.new }
  let(:task) { Task.new "Test the task store" }

  it "returns a tasklist on read" do
    store.read.tasks.length.should == 0
  end

  it "stores a TaskList with one task and retrieve it" do
    list = TaskList.new
    list.add task

    store.save(list)
    store = TaskStore.new
    store.read.tasks[0].id.should == task.id
  end
end
