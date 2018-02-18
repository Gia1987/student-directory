9
@students = [] # an empty array accessible to all methods

@withd = 120 


def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to file"
  puts "4. Load the list form file"
  puts "9. Exit" # 9 because we'll be adding more items  
end

def interactive_menu
  loop do 
    print_menu 
    proccess(STDIN.gets.chomp) # read the input and save it into a variable
   end
end

def proccess(selection)
  case selection
    when "1" 
      puts "Adding students section"#input the students
      input_students 
    when "2" 
      show_students #show the students
    when "3" 
      save_students
    when "4"
      load_students  #4. load students.cvs by default
    when "9"
      puts "The program has been quit!"
      exit #this will couse the program to terminate
    else
      puts " I don't know you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students, to finish, just hit return twice"
  name = STDIN.gets.chomp  #get the first name
  if name.empty?
    puts "There is not any student on the list!"
  end
  while !name.empty? do # while the name is not empty, repeat this code
    storage_student(name)
    puts "Now we have #{@students.count} " + (@students.count > 1 ? 'students' : 'student')
    puts "Please enter the name of another student, to finish, just hit return twice"
    name = STDIN.gets.chomp  #get another name from the user
  end
end

def storage_student(name, cohort = :november)
  @students <<  {name: name, cohort: cohort }
end

def show_students
  print_header
  print_students_list
  print_footer
  #cohort
end

def print_header
  puts "The student of Villains Academy".center(@withd)
  puts "-------------".center(@withd)
end

def print_students_list
  if @students == nil
	  puts "There are no students!\n\n"
	  return
  end
	puts "Type 'All' to see all the students, or type the letter which starts the name with:"
	letter = gets.chomp
	i = 0
	while i < @students.length do
	  if "#{@students[i][:name]}".start_with?(letter.upcase) and "#{@students[i][:name]}".length < 12
  	  puts "#{(i + 1)}. #{@students[i][:name]} (#{@students[i][:cohort]} cohort)".center(@withd)
		elsif letter == "All"
		  puts "#{(i + 1)}. #{@students[i][:name]} (#{@students[i][:cohort]} cohort)".center(@withd)
		end
		i += 1
  end
end

def print_footer
  puts "Overall, we have #{@students.count} " + (@students.count > 1 ? 'students' : 'student')
end

def save_students
  puts "Where would you like save your students list?"
  students_list_name = gets.chomp
  File.open("#{students_list_name}.csv", "w") do |file| #open the file for writing
    @students.each do |student|  #iterate over the array of students
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
    puts "The list has been updated! "
  end
end

def load_students
	puts "Which file do you want to retrieve the data from?"
	filename = gets.chomp
	if File.exists?(filename)  # if it exists
	  File.open(filename, "r") do |file|
	    file.readlines.each do |line|
	      name, cohort = line.chomp.split(', ')
	 	    storage_student(name)
	    end
	  puts "Loaded #{@students.count} from #{filename}"
	 	puts "Students data base succesfully retrieved"
	 	end
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil?
	 return
	end
	if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def cohort
  if @students == nil
	  return
  end
  cohort = {}
  @students.each do |x|
    cohorts = x[:cohort]
    person = x[:name]
    if cohort[cohorts] == nil
      cohort[cohorts] = [person]
    else
      cohort[cohorts].push(person)
    end
  end
  puts cohort.to_a
	puts "Students list succesfully displayed"
end

try_load_students
interactive_menu