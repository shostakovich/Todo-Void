require_relative "../lib/todo_view"

class TodoListView
  def self.render(todos)
    output = ""
    todos.each do |todo|
      output += TodoView.new(todo).render
      output += "\n"
    end
    output
  end
end

