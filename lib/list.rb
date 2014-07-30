class List
  def initialize(name, id)
    @name = name
    @tasks = []
    @id = id
  end

  def name
    @name
  end

  def tasks
    @tasks
  end

  def id
    @id
  end

  def add_task(task)
    @tasks.push(task)
  end
end
