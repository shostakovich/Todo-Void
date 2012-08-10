require 'rainbow'

class TodoView
  def initialize(todo)
    @todo = todo
  end

  def render
    output = "#{formated_id} #{@todo.description}"
    output += tags
    mark_if_finished(output)
  end

  private
  def formated_id
    if @todo.status == :started
      @todo.id.foreground(:green)
    elsif @todo.status == :pending
      @todo.id.foreground(:yellow)
    else
      @todo.id
    end
  end

  def tags
    return "" if @todo.tags.empty?
    tags = " (#{@todo.tags.join(', ')})"
    tags = tags.foreground(:green) unless @todo.status == :finished
    tags
  end

  def mark_if_finished(output)
    if @todo.status == :finished
      output.foreground(:black)
    else
      output
    end
  end
end
