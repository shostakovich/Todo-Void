require_relative '../lib/task_store'

class TaskInteractor
  def self.add_task(name)
    store = TaskStore.new
    list = store.read
    task = Task.new ARGV[0]
    list.add(task)
    store.save(list)
  end

  def self.delete_task(hash)
    store = TaskStore.new
    list = store.read
    list.remove(ARGV[1])
    store.save(list)
  end

  def self.list_all
    store = TaskStore.new
    store.read.tasks
  end
end
