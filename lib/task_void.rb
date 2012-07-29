require_relative '../interactors/task_interactor.rb'
require_relative './task_list_view.rb'

class TaskVoid
  def self.execute(args)
    interactor = TaskInteractor.new
    output = ""

    if args[0] == "-d"
      interactor.delete_task(args[1])
    elsif args[0] == "-f"
      interactor.finish_task(args[1])
    elsif args[0] == "-s"
      interactor.start_task(args[1])
    elsif args[0] == "--help"
      output = "Help:\nt 'Mowing the lawn' in order to create a task\n-f ID to finish a task\n-d ID to delete a task"
    elsif args[0]
      interactor.add_task(args[0])
    else
      view = TaskListView.new(interactor.list_all)
      output = view.render
    end
    output
  end
end
