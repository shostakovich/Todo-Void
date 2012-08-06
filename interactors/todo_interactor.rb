require_relative '../lib/todo_store'
require_relative '../lib/todo_filter'

class TodoInteractor
  def initialize(store = TodoStore.new)
    @store = store
  end
  
  def add_todo(description)
    @store.save(Todo.new(description))
  end

  def list_all
    todos = @store.todos
    filter_todos(todos)
  end

  private
  def filter_todos(todos)
    filter = TodoFilter.new(todos) 
    filter.with_status([:started, :pending, :finished]).recent.execute
  end
end
