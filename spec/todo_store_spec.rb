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
  end

  let(:store){ TodoStore.new }
  let(:todo) do
    todo = Todo.new "Test the todo store"
    todo.status = :finished
    todo
  end

  it "returns a TodoList on read" do
    store.todos.todo.length.should == 0
  end

  it "stores and retrieves a todo" do
    store.save(todo)

    store = TodoStore.new
    store.todos.todo[todo.id].id == todo.id
  end

  it "updates todos" do
    store.save(todo)

    todo.status = :updated
    store = TodoStore.new
    store.todos.todo[todo.id].status == :updated
  end
end
