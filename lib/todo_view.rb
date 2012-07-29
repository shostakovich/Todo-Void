require 'rainbow'

class TodoView
  def initialize(todo)
    @todo = todo
  end

  def render
    if @todo.status == :finished
      "#{@todo.id} #{@todo.description}".foreground(:black)
    elsif @todo.status == :started
      "#{@todo.id.foreground(:green)} #{@todo.description}"
    else
      "#{@todo.id.foreground(:yellow)} #{@todo.description}"
    end
  end
end
