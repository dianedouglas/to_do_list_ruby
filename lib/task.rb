class Task
  def initialize(description, id, priority)
    @description = description
    @id = id
    @priority = priority
  end

  def description
    @description
  end

  def id
    @id
  end

  def priority
    @priority
  end
end
