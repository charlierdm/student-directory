def input_students
	puts "Please enter the name of the students"
	puts "To finish, just hit return twice"
	# create an empty array
	students = []
	# get the first name
	name = gets.chomp
	#while the name is not empty, repeat this code
	while !name.empty? do
	  # add the student hash to the array
	  if name[0].upcase == "B"
			students << {name: name, cohort: :november}
	  	puts "Now we have #{students.count} students"
	  else
	  	puts "That name doesn't begin with b."
	  # get another name from the user
	  end
	  name = gets.chomp
	end
	# return the array of students
	students
end

def print_header
	puts "The students of Villains Academy"
	puts "-------------"
end

def print(students)
	students.each_with_index do |student, index|
		puts "#{index + 1}.#{student[:name]} (#{student[:cohort]} cohort)"
	end
end

def print_footer(names)
	puts "Overall, we have #{names.count} great students"
end
# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)