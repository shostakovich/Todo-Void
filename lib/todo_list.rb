class TodoList
  attr_reader :todo
  
  def initialize
    @todo = {}
  end

  def add(todo)
    @todo.store(todo.id, todo)
  end

  def find(search)
    list = TodoList.new
    @todo.each do |id, todo|
      list.add todo if /^#{search}/.match id
    end
    list
  end

  def length
    @todo.length
  end

  def empty?
    @todo.length == 0
  end

  def remove(hash)
    @todo.delete(hash)
  end
end
