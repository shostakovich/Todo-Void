require 'set'

class TodoList < Set
  def update(todo)
    delete(todo)
    add(todo)
  end
end
