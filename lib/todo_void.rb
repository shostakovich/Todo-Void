require 'require_relative'
require_relative '../interactors/todo_interactor.rb'
require_relative '../interactors/status_changes_interactor.rb'
require_relative './todo_list_view'

class TodoVoid
  def self.execute(args)
    output = ""

    if args[0] == "-d"
      TodoInteractor.new.delete_todo(args[1])
    elsif args[0] == "-f"
      begin
        StatusChangesInteractor.new.finish_todo(args[1])
      rescue StatusChangesInteractor::ConflictingIdsError => e
        output += "Conflicting part of an id provided please be more specific:\n"
        output += TodoListView.render(e.conflicting_todos)
      end
    elsif args[0] == "-s"
      StatusChangesInteractor.new.start_todo(args[1])
    elsif args[0] == "--help"
      output = "Help:\nt 'Mowing the lawn' in order to create a todo\n-f ID to finish a todo\n-d ID to delete a todo"
    elsif args[0]
      TodoInteractor.new.add_todo(args[0])
    else
      todos = TodoInteractor.new.list_all
      output = TodoListView.render(todos)
    end
    output
  end
end
