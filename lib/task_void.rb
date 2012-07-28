require_relative '../interactors/task_interactor.rb'
require_relative './task_list_view.rb'

class TaskVoid
  def self.execute(args)
    interactor = TaskInteractor.new
    output = ""
    
    if args[0] == "-d"
      interactor.delete_task(args[1])
    elsif(args[0] == "-f")
      interactor.finish_task(args[1])
    elsif(args[0])
      interactor.add_task(args[0])
    else
      view = TaskListView.new(interactor.list_all)
      view.render
    end
  end
end
