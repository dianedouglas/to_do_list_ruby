class Task
  def initialize(description, id, priority, duedate)
    @description = description
    @id = id
    @priority = priority
    @duedate = Date.parse(duedate)
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

  def duedate
    #returns date object
    @duedate
  end
end
