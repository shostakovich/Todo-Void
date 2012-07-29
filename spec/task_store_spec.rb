require_relative '../lib/todo_store'
require_relative '../lib/todo'

class TodoStore
  private
  def todo_file
    '/tmp/todos'
  end
end

describe TodoStore do
  before do
    system "rm /tmp/todos"
    system "touch /tmp/todos"
  end

  let(:store){ TodoStore.new }
  let(:todo) do
    todo = Todo.new "Test the todo store"
    todo.status = :finished
    todo
  end

  it "returns a TodoList on read" do
    store.read.todo.length.should == 0
  end

  it "stores and retrieves TodoList with one todo" do
    list = TodoList.new
    list.add todo
    store.save(list)

    store = TodoStore.new
    store.read.todo[todo.id]
  end
end
