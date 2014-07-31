require './lib/task'
require './lib/list'
require 'date'

@list_of_tasks = []
@lists = []
@done_list = []
@current_task = 1
@current_list = 1

def main_menu
  loop do
    puts "Welcome to the main menu. Please select from the following"
    puts "'a' to add a task. 'n' to create a new list. 'l' to select a list."
    puts "'t' to select and edit a task.'c' to list completed tasks. 'x' to exit."

    main_choice = gets.chomp
    if main_choice == 'a'
     create_new_task
    elsif main_choice == 'n'
     create_new_list
    elsif main_choice == 'l'
     list_tasks
    elsif main_choice == 't'
      select_task
    elsif main_choice == 'c'
      completed_list
    elsif main_choice == 'x'
     puts "Good-bye..."
     exit
    else
     puts "I'm sorry, Dave. I don't understand you..."
    end
  end
end

def create_new_task
  puts "Please enter a description of your task."
  user_description = gets.chomp
  puts "Please enter a priority level of 'high', 'med' or 'low'"
  user_priority = gets.chomp
  if !(user_priority == 'high' || user_priority == 'med' || user_priority == 'low')
    puts "Does not compute. Please use either 'high', 'med' or 'low'."
    create_new_task
  end
  puts "Please enter a due date."
  puts "First enter the year."
  year = gets.chomp
  puts "Now enter the month."
  month = gets.chomp
  puts "Now enter the date."
  date = gets.chomp

  duedate = year+month+date
  puts duedate

  new_task = Task.new(user_description, @current_task, user_priority, duedate)
  @list_of_tasks << new_task
  @current_task += 1
  puts new_task.priority
end

def create_new_list
  puts "What would you like your list to be named?"
  user_list_name = gets.chomp
  new_list = List.new(user_list_name, @current_list)
  @lists << new_list
  @current_list += 1
  puts new_list.id
end

def list_tasks
  puts "Here are your lists!"
  @lists.each do |list|
    puts "#{list.id}. #{list.name}"
  end
  puts "Please enter a number to select your list. Enter '1' to pick your first list."
  puts "If there are no lists, press 'x' to return to the main menu."
  list_choice = gets.chomp
  if list_choice == 'x'
    main_menu
  elsif list_choice.to_i.between?(1,@lists.length)
    @current_list = list_choice.to_i
    puts "Here are your tasks:"
    puts @lists[@current_list-1].name
    @lists[@current_list-1].tasks.each do |task|
      puts "#{task.id}. #{task.description}"
    end
  end
  puts "\n\n"
  puts "Would you like to see your tasks sorted according to due date?"
  puts "Please press 'y' for 'yes', or 'n' for 'no way, dude...'"
  user_yes_or_no = gets.chomp
  if user_yes_or_no == 'y'
    @lists[@current_list-1].date_sort.each do |task|
      puts "#{task.duedate} - #{task.description}"
    end
  elsif user_yes_or_no == 'n'
    puts "No worries. Returning to main menu."
    main_menu
  else
    puts "Does not compute. Returning to main menu..."
    main_menu
  end
end

def select_task
  @list_of_tasks.each do |task|
    puts "#{task.id}. #{task.description}"
  end
  puts "Please enter a number to select your task. Enter '1' to pick your first task."
  puts "If there are no tasks, press 'x' to return to the main menu."
  task_number = gets.chomp
  if task_number == 'x'
    main_menu
  elsif !task_number.to_i.between?(1,@list_of_tasks.length)
    puts "That task doesn't exist. Please try again."
    select_task
  end
  @current_task = task_number.to_i
  puts @list_of_tasks[@current_task-1].id.to_s + ".  "+ @list_of_tasks[@current_task-1].description
  puts "Enter 'd' to mark it as done, 'a' to add it to a list, or enter any other key to return to main menu."
  user_option = gets.chomp
  if(user_option == 'd')
    task_done
  elsif user_option == 'a'
    add_to_list
  else
    main_menu
  end
end

def task_done
  @done_list << @list_of_tasks[@current_task-1]
  @list_of_tasks.delete_at(@current_task-1)
  puts "Task done."
end

def add_to_list
  @lists.each do |list|
    puts list.id.to_s + ". " + list.name
  end
  puts "Enter a number to select a list, or press 'x' to return to the main menu."
  list_choice = gets.chomp
  if list_choice == 'x'
    main_menu
  elsif list_choice.to_i.between?(1,@lists.length)
    @current_list = list_choice.to_i
    @lists[@current_list-1].tasks << @list_of_tasks[@current_task-1]
    puts @lists[@current_list-1].tasks[@lists[@current_list-1].tasks.length-1].description + " has been added to the list."

  else
    puts "Does not compute!"
    add_to_list
  end

end

def completed_list
  puts "Here are all of the tasks you've done! wOOt!"
  @done_list.each do |done|
    puts done.description
  end
end
main_menu
