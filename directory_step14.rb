require 'csv'
@students = [] 

puts __FILE__

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" 
end

def interactive_menu
  loop do
    print_menu
    menu_options(STDIN.gets.chomp)
  end
end

def menu_options(selection)
  case selection 
    when "1" then input_students
    when "2" then show_students
    when "9" then exit 
    when "3" then save_students
    when "4" then load_students
    else puts "I don't know what you meant, try again".center(100)
  end
end

def data_to_array(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def choose_filename
  puts "Please choose the filename"
  STDIN.gets.chomp
end

def input_students
  puts "Please enter the students name".center(100)
  puts "To finish, just hit return".center(100)
  name = STDIN.gets.chomp
  while !name.empty? do
    data_to_array(name, cohort = :november)
    puts "Now we have #{@students.count} students".center(100)
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(100)
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students".center(100)
end

def save_students
  CSV.open(choose_filename, "w") do |csv|
    @students.each do |student|
      csv << student_data = [student[:name], student[:cohort]]
    end 
  end
  puts "#{@students.count} student entries added.".center(100)
end

def load_students(filename = "students.csv")
  CSV.foreach(filename) do |row|
  name = row.first
  cohort = row.pop
  data_to_array(name, cohort)
  end
end

def try_load_students
  filename = ARGV.empty? ? "students.csv" : ARGV.first
  return if filename.nil? 
  if File.exists?(filename) 
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}".center(100)
  else 
    puts "Sorry, #{filename} doesn't exist.".center(100)
    exit 
  end
end

try_load_students
interactive_menu

