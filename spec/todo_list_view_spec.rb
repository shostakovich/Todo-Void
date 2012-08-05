require_relative "../lib/todo"
require_relative "../lib/todo_list_view"

describe TodoListView do
  it "renders multiple TodoViews at once" do
    todo1 = Todo.new "Hello"
    todo2 = Todo.new "World"

    output = TodoListView.render([todo1, todo2])
    output.should == "\e[33mf7ff9e\e[0m Hello\n\e[33m70c07e\e[0m World\n"
  end
end
