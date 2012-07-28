require_relative '../interactors/task_interactor.rb'
require_relative './task_view.rb'

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
      interactor.list_all.each do |task|
        output += TaskView.new(task).render
        output += "\n"
      end
    end
    output
  end
end
