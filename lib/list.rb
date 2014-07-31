require 'pry'

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

  def date_sort
    tasks_with_dates = {}
    @tasks.each do |task|
      tasks_with_dates[task.duedate] = task
    end
    sorted_tasks = Hash[tasks_with_dates.sort]
    output_ordered_tasks = []
    sorted_tasks.each_value do |value|
      output_ordered_tasks << value
    end
    output_ordered_tasks
  end
end
