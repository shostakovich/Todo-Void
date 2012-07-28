class TaskList
  attr_reader :tasks
  
  def initialize
    @tasks = {}
  end

  def add(task)
    @tasks.store(task.id, task)
  end

  def find(search)
    @tasks.each do |id, task|
      return task if /^#{search}/.match id
    end
    nil
  end

  def remove(hash)
    @tasks.delete(hash)
  end
end
