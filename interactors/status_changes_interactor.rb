class StatusChangesInteractor
  class ConflictingIdsError < StandardError
    attr_reader :conflicting_todos

    def initialize(conflicting_todos)
      @conflicting_todos = conflicting_todos
    end
  end

  def initialize(store = TodoStore.new)
    @store = store
    @list = @store.todos
  end

  def change_status(hash, status)
    change_todo_status(hash, status)
  end

  private
  def change_todo_status(hash, status)
    todos = @list.find(hash).to_array
    
    if todos.length > 1
      raise ConflictingIdsError.new(todos)
    elsif todos.length == 1
      todos[0].status = status
      @store.update(todos[0])
    end
  end
end
