class StatusChangesInteractor
  class ConflictingIdsError < StandardError
    attr_reader :conflicting_todos

    def initialize(conflicting_todos)
      @conflicting_todos = conflicting_todos
    end
  end

  def initialize(store = TodoStore.new)
    @store = store
    @list = @store.read
  end

  def change_status(hash, status)
    change_todo_status(hash, status)
  end

  private
  def change_todo_status(hash, status)
    found_todos = @list.find(hash)
    
    if found_todos.length > 1
      raise ConflictingIdsError.new(found_todos.to_array)
    elsif found_todos.length == 1
      found_todos.todo.each do |key, todo|
        todo.status = status
        @list.update(todo)
      end
      @store.save(@list)
    end
  end
end
