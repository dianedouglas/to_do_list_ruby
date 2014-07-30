require './lib/task'
require './lib/list'

@list = []
@lists = []
@done_list = []
@current_task = 1
@current_list = 1

def main_menu
  loop do
    puts "Welcome to the main menu. Please select from the following"
    puts "'a' to add a task. 'n' to create a new list. 'l' to list all tasks. 's' to select and edit a task."
    puts "'c' to list completed tasks. 'x' to exit."

    main_choice = gets.chomp
    if main_choice == 'a'
     create_new_task
    elsif main_choice == 'n'
     create_new_list
    elsif main_choice == 'l'
     list_tasks
    elsif main_choice == 's'
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
  new_task = Task.new(user_description, @current_task)
  @list.push(new_task)
  @current_task += 1
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
  puts "Here are your tasks:"
  @list.each do |task|
    puts "#{task.id}. #{task.description}"
  end
  puts "\n\n"
end

def select_task
  list_tasks
  puts "Please enter a number to select your task. Enter '1' to pick your first task."
  task_number = gets.chomp.to_i
  @current_task = task_number
  puts @list[task_number-1].id.to_s + ".  "+ @list[task_number-1].description
  puts "Enter 'd' to mark it as done. Enter any other key to return to main menu."
  choose_d_or_not = gets.chomp
  if(choose_d_or_not == 'd')
    task_done
  else
    main_menu
  end
end

def task_done
  @done_list << @list[@current_task-1]
  @list.delete_at(@current_task-1)
  puts "Task done."
end

def completed_list
  puts "Here are all of the tasks you've done! wOOt!"
  @done_list.each do |done|
    puts done.description
  end
end
main_menu
