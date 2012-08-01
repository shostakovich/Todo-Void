require_relative '../lib/todo_store'

class TodoInteractor
  def initialize(store = TodoStore.new)
    @store = store
  end
  
  def add_todo(description)
    @store.save(Todo.new(description))
  end

  def list_all
    @store.todos.to_array
  end
end
