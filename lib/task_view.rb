require 'rainbow'

class TaskView
  def initialize(task)
    @task = task
  end

  def render
    "#{@task.id.foreground(:yellow)} #{@task.description}"
  end
end
