def input_students
	puts "Please enter the name of the student first and then their cohort".center(100)
	puts "To finish, just hit return twice".center(100)
	# create an empty array
	students = []
	# get the first name
	loop do
	@name = gets.strip
	@cohort = gets.strip.to_sym
	
    @cohort = :november if @cohort.empty?
    puts "Confirm entries, press Y to proceed, N to correct typos.".center(100)
    typo = gets.strip.upcase
      if typo == "Y"
        break 
      else 
        puts "Re-Enter name and cohort.".center(100)
      end
    end
	
	# while the name is not empty, repeat this code
  while !@name.empty? do
	  # add the student hash to the array
		students << {name: @name, cohort: @cohort}
		
	  if students.length > 1 
	  	puts "Now we have #{students.count} students".center(100)
	  else 
	    puts "Now we have #{students.count} student".center(100)
	  end
	  # get another name from the user
	  puts "Enter name followed by cohort.".center(100)
	  @name = gets.strip
	  if @name.empty? 
	  	break
	  end
	  @cohort = gets.strip.to_sym
  end
	students
end

def print_header
	puts "The students of Villains Academy".center(100)
	puts "-------------".center(100)
end

def print_students(students)
  if !students.empty?
    # iterate through students, create array of cohorts
    sorted_cohorts = []
    students.each do |student|
      sorted_cohorts << student[:cohort]
    end
    # iterate through that array, print each student in students where the cohort matches
    sorted_cohorts.uniq.each do |cohort|
      students.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)".center(100) if student[:cohort] == cohort }
    end
  end
end

def print_footer(names)
	puts "Overall, we have #{names.count} great students".center(100)
end
# nothing happens until we call the methods
students = input_students
if students.length >= 1
  print_header
  print_students(students)
  print_footer(students)
else
 puts "No students entered".center(100)
end


