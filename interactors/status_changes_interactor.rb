require_relative '../lib/todo_filter'

class StatusChangesInteractor
  class StatusChangesInteractor::NoTodoWithIdError < StandardError ; end
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
    todos = TodoFilter.new(@list)
                      .with_hash(hash)
                      .with_status([:finished, :started, :pending])
                      .recent
                      .execute
    todos = todos.to_a

    case todos.length
    when 0
      raise StatusChangesInteractor::NoTodoWithIdError
    when 1
      todos[0].status = status
      @store.update(todos[0])
    else
      raise ConflictingIdsError.new(todos)
    end
  end
end
