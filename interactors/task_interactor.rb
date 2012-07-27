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
    @list.remove(ARGV[1])
    save_list
  end

  def list_all
    @list.tasks
  end

  private
  def save_list
    @store.save(@list)
  end
end
