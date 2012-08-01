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

  def update(todo)
    @todo.delete(todo.id)
    @todo[todo.id] = todo
  end

  def to_array
    todos = []
    @todo.each do |id, todo| todos << todo end
    todos
  end
end
