require 'set'

class TodoList < Set
  def find(search)
    list = TodoList.new
    each do |todo|
      list.add todo if /^#{search}/.match(todo.id)
    end
    list
  end

  def update(todo)
    delete(todo)
    add(todo)
  end
end
