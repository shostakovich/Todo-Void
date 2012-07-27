class TaskList
  attr_reader :tasks
  
  def initialize
    @tasks = []
  end

  def add(description)
    task = description
    @tasks << task
  end

  def remove(hash)
    @tasks.reject!{|task| task.id == hash}
  end
end
