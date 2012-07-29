class TodoList
  attr_reader :todo
  
  def initialize
    @todo = {}
  end

  def add(todo)
    @todo.store(todo.id, todo)
  end

  def find(search)
    @todo.each do |id, todo|
      return todo if /^#{search}/.match id
    end
    nil
  end

  def remove(hash)
    @todo.delete(hash)
  end
end
