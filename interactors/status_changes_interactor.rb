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
    found_todos = @list.find(hash)
    if found_todos.length == 1
      found_todos.todo.each do |key, todo|
        @list.remove(todo)
        todo.status = status
        @list.add(todo)
      end
      @store.save(@list)
    end
  end
end
