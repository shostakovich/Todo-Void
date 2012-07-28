require_relative "../lib/task_view"

class TaskListView
  def initialize(tasks)
    @tasks = tasks
  end

  def render
    @output = ""
    pending_tasks.each { |task| render_task(task) }
    finished_tasks.each { |task| render_task(task) }
    @output
  end

  private
  def render_task(task)
    @output += TaskView.new(task).render
    @output += "\n"
  end
  
  def pending_tasks
    @tasks.reject {|task| task.status != :pending}
  end

  def finished_tasks
    @tasks.reject {|task| task.status != :finished}
  end
end

