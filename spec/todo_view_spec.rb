require_relative './spec_helper'
require_relative '../lib/todo'
require_relative '../lib/todo_view'

describe TodoView do
  it "can render a default todo" do
    todo = Todo.new("Hello World")
    TodoView.new(todo).render.should =~ /#{todo.id}/
    TodoView.new(todo).render.should =~ /#{todo.description}/
  end
  
  context "when it renders a todo with tags" do
    it "appends them at the end" do
      todo = Todo.new('With tags')
      todo.tags = ['lorem', 'ipsum']

      TodoView.new(todo).render.should =~ /\(lorem, ipsum\)/
    end
  end
end
