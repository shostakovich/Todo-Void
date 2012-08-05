require_relative "../lib/todo_view"

class TodoListView
  def self.render(todos)
    self.new(todos).render
  end

  def initialize(todos)
    @todos = todos
  end

  def render
    @output = ""
    render_todo_by_status(:started)
    render_todo_by_status(:pending)
    render_todo_by_status(:finished)
    @output
  end

  private
  def render_todo_by_status(status)
    todos_by_status(status).each { |todo| render_todo(todo) }
  end

  def todos_by_status(status)
    todos = @todos.reject {|todo| todo.status != status}
    if status == :finished
      todos.reject do |todo|
        todo.finished_at < (Time.now - 86400)
      end
    else
      todos
    end
  end

  def render_todo(todos)
    @output += TodoView.new(todos).render
    @output += "\n"
  end
end

