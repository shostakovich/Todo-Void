class StatusChangesInteractor
  def initialize(store = TodoStore.new)
    @store = store
    @list = @store.read
  end

  def finish_todo(hash)
    change_todo_status(hash, :finished)
  end

  def start_todo(hash)
    change_todo_status(hash, :started)
  end

  private
  def change_todo_status(hash, status)
    todo = @list.find(hash)
    @list.remove(todo)
    todo.status = status
    @list.add(todo)
    @store.save(@list)
  end
end