require 'rainbow'

class TaskView
  def initialize(task)
    @task = task
  end

  def render
    if @task.status == :finished
      "#{@task.id} #{@task.description}".foreground(:black)
    elsif @task.status == :started
      "#{@task.id.foreground(:green)} #{@task.description}"
    else
      "#{@task.id.foreground(:yellow)} #{@task.description}"
    end
  end
end
