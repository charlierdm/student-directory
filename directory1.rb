def input_students
	
	puts "Please enter the name of the student first and then their cohort".center(100)
	puts "To finish, just hit return twice".center(100)
	# create an empty array
	students = []
	# get the first name
	loop do
	@name = gets.chomp
	@cohort = gets.chomp.to_sym
	
    @cohort = :november if @cohort.empty?
    puts "Confirm entries, press Y to proceed, N to correct typos.".center(100)
    spellings = gets.chomp.upcase
      if spellings == "Y"
        break 
      else 
        puts "Re-Enter name and cohort.".center(100)
      end
    end
	
	# while the name is not empty, repeat this code
  while !@name.empty? do
	  # add the student hash to the array
	  puts "Please enter the student height in cm followed by birthplace".center(100)
	  height = gets.chomp
	  birthplace = gets.chomp
		students << {name: @name, cohort: @cohort, height: height,
								birthplace: birthplace}
	  puts "Now we have #{students.count} students".center(100)
	  # get another name from the user
	  puts "Enter name followed by cohort.".center(100)
	  @name = gets.chomp
	  if @name.empty? 
	  	break
	  end
	  @cohort = gets.chomp.to_sym
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
	  puts "#{index + 1}.#{student[:name]} (#{student[:cohort]} cohort), height: #{student[:height]}cm, born: #{student[:birthplace]}".center(100)
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