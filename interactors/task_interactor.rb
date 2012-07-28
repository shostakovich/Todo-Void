require_relative '../lib/task_store'

class TaskInteractor
  def initialize(store = TaskStore.new)
    @store = store
    @list = @store.read
  end
  
  def add_task(name)
    @list.add(Task.new(name))
    save_list
  end

  def delete_task(hash)
    @list.remove(hash)
    save_list
  end

  def finish_task(hash)
    task = @list.find(hash)
    @list.remove(task)
    task.status = :finished
    @list.add(task)
    save_list
  end

  def list_all
    tasks = []
    @list.tasks.each do |id, task| tasks << task end
    tasks
  end

  private
  def save_list
    @store.save(@list)
  end
end
