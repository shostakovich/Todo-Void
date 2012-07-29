require_relative "../lib/task_view"

class TaskListView
  def initialize(tasks)
    @tasks = tasks
  end

  def render
    @output = ""
    render_tasks_by_status(:started)
    render_tasks_by_status(:pending)
    render_tasks_by_status(:finished)
    @output
  end

  private
  def render_tasks_by_status(status)
    tasks_by_status(status).each { |task| render_task(task) }
  end

  def tasks_by_status(status)
    @tasks.reject {|task| task.status != status}
  end

  def render_task(task)
    @output += TaskView.new(task).render
    @output += "\n"
  end
end

