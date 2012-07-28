class TaskList
  attr_reader :tasks
  
  def initialize
    @tasks = {}
  end

  def add(task)
    @tasks.store(task.id, task)
  end

  def find(hash)
    @tasks[hash]
  end

  def remove(hash)
    @tasks.delete(hash)
  end
end
