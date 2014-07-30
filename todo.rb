require './lib/task'

def main_menu
  loop do
    puts "Welcome to the main menu. Please select from the following"
    puts "'a' to add a task. 'l' to list all tasks. 'x' to exit."

    main_choice = gets.chomp
    if main_choice = 'a'
     add_task
    elsif main_choice = 'l'
     list_tasks
    elsif main_choice = 'x'
     puts "Good-bye..."
     exit
    else
     puts "I'm sorry, Dave. I don't understand you..."
    end
  end
end

def add_task
end

def list_tasks
end

