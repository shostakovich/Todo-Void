require_relative './todo_list'

class TodoFilter
  def initialize(todos)
    @todos = todos.dup
    @todos.reject! { |todo| todo.status == :deleted }
  end

  def with_hash(search)
    @todos.reject! { |todo| not /^#{search}/.match(todo.id) }
    self
  end

  def with_status(statuses)
    result = []
    statuses.each do |status|
      todos_with_status(status).each do |todo|
        result << todo
      end
    end
    @todos = result
    self
  end

  def recent
    @todos.reject! do |todo|
      todo.status == :finished &&
        todo.finished_at < (Time.now - 86400)
    end
    self
  end

  def execute
    TodoList.new(@todos)
  end

  private

  def todos_with_status(status)
    @todos.reject { |todo| todo.status != status }
  end
end
