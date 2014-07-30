require './lib/task'

@list = []

def main_menu
  loop do
    puts "Welcome to the main menu. Please select from the following"
    puts "'a' to add a task. 'l' to list all tasks. 'x' to exit."

    main_choice = gets.chomp
    if main_choice == 'a'
     create_new_task
    elsif main_choice == 'l'
     list_tasks
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
  new_task = Task.new(user_description)
  @list.push(new_task)
end

def list_tasks
  puts "Here are your tasks:"
  @list.each do |task|
    puts task.description
  end
end

main_menu
