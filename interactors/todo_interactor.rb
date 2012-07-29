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

  def finish_todo(hash)
    change_todo_status(hash, :finished)
  end

  def start_todo(hash)
    change_todo_status(hash, :started)
  end

  def list_all
    todos = []
    @list.todo.each do |id, todo| todos << todo end
    todos
  end

  private
  def change_todo_status(hash, status)
    todo = @list.find(hash)
    @list.remove(todo)
    todo.status = status
    @list.add(todo)
    save_list
  end

  def save_list
    @store.save(@list)
  end
end
