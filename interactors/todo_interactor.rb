require_relative '../lib/todo_store'

class TodoInteractor
  def initialize(store = TodoStore.new)
    @store = store
    @list = @store.read
  end
  
  def add_todo(description)
    @list.add(Todo.new(description))
    @store.save(@list)
  end

  def list_all
    @list.to_array
  end
end
