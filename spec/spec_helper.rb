require 'simplecov'
SimpleCov.start do
  add_filter "/spec/"
end

class TodoStore
  private
  def todo_file
    '/tmp/todos'
  end
end
