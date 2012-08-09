require 'rainbow'

class TodoView
  def initialize(todo)
    @todo = todo
  end

  def render
    output = if @todo.status == :finished
      "#{@todo.id} #{@todo.description}".foreground(:black)
    elsif @todo.status == :started
      "#{@todo.id.foreground(:green)} #{@todo.description}"
    else
      "#{@todo.id.foreground(:yellow)} #{@todo.description}"
    end

    output += " (#{@todo.tags.join(', ')})".foreground(:green) unless @todo.tags.empty?
    output
  end
end
