def input_students
	puts "Please enter the name of the student first and then their cohort".center(100)
	puts "To finish, just hit return twice".center(100)
	# create an empty array
	students = []
	# get the first name
	name = gets.chomp
	cohort = gets.chomp.to_sym
	puts "Is there a spelling error? y/n"
	spelling = gets.chomp
	if spelling == "y" # prompts user to re-enter if there are spelling errors.
		puts "Please enter the name of the student first and then their cohort".center(100)
	  puts "To finish, just hit return twice".center(100)
	  name = gets.chomp
	  cohort = gets.chomp.to_sym # converts the string to a symbol.
	end
	# this gives the cohort a default value.
	if cohort.empty? then cohort = :november end
	# while the name is not empty, repeat this code
 
	while !name.empty? do
	  # add the student hash to the array
	  puts "Please enter the student height in cm".center(100)
	  height = gets.chomp
	  puts "Please enter place of birth".center(100)
	  birthplace = gets.chomp
		students << {name: name, cohort: cohort, height: height,
								birthplace: birthplace}
	  puts "Now we have #{students.count} students".center(100)
	  # get another name from the user
	  name = gets.chomp
	  if name.empty? 
	  	break
	  end
	  cohort = gets.chomp.to_sym
	  puts "Is there a spelling error? y/n"
	spelling = gets.chomp
	if spelling == "y" # prompts user to re-enter if there are spelling errors.
		puts "Please enter the name of the student first and then their cohort".center(100)
	  puts "To finish, just hit return twice".center(100)
	  name = gets.chomp
	  cohort = gets.chomp.to_sym # converts the string to a symbol.
	end
	end
	# return the array of students
	students
end


def print_header
	puts "The students of Villains Academy".center(100)
	puts "-------------".center(100)
end

def print(students)
	counter = 0 
  while counter < students.length
	  students.each_with_index do |student, index|
	  puts "#{index + 1}.#{student[:name]} (#{student[:cohort]} cohort), height :#{student[:height]}cm, born: #{student[:birthplace]}".center(100)
	  counter += 1
	  end
  end
  
end

def print_footer(names)
	puts "Overall, we have #{names.count} great students".center(100)
end
# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)