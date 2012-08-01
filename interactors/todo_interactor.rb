require_relative '../lib/todo_store'

class TodoInteractor
  def initialize(store = TodoStore.new)
    @store = store
    @list = @store.read
  end
  
  def add_todo(description)
    @list.add(Todo.new(description))
    save_list
  end

  def delete_todo(hash)
    @list.remove(hash)
    save_list
  end

  def list_all
    @list.to_array
  end

  private
  def save_list
    @store.save(@list)
  end
end
