require 'require_relative'
require_relative '../interactors/todo_interactor.rb'
require_relative '../interactors/status_changes_interactor.rb'

class TodoVoid
  def self.execute(args)
    output = ""

    if args[0] == "-d"
      TodoInteractor.new.delete_todo(args[1])
    elsif args[0] == "-f"
      StatusChangesInteractor.new.finish_todo(args[1])
    elsif args[0] == "-s"
      StatusChangesInteractor.new.start_todo(args[1])
    elsif args[0] == "--help"
      output = "Help:\nt 'Mowing the lawn' in order to create a todo\n-f ID to finish a todo\n-d ID to delete a todo"
    elsif args[0]
      TodoInteractor.new.add_todo(args[0])
    else
      require_relative './todo_list_view.rb'
      todos = TodoInteractor.new.list_all
      view = TodoListView.new(todos)
      output = view.render
    end
    output
  end
end
