require_relative '../interactors/todo_interactor.rb'
require_relative './todo_list_view.rb'

class TodoVoid
  def self.execute(args)
    interactor = TodoInteractor.new
    output = ""

    if args[0] == "-d"
      interactor.delete_todo(args[1])
    elsif args[0] == "-f"
      interactor.finish_todo(args[1])
    elsif args[0] == "-s"
      interactor.start_todo(args[1])
    elsif args[0] == "--help"
      output = "Help:\nt 'Mowing the lawn' in order to create a todo\n-f ID to finish a todo\n-d ID to delete a todo"
    elsif args[0]
      interactor.add_todo(args[0])
    else
      view = TodoListView.new(interactor.list_all)
      output = view.render
    end
    output
  end
end
