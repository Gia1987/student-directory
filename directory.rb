@students = [] # an empty array accessible to all methods
@withd = 50 
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list form students.csv"
  puts "9. Exit" # 9 because we'll be adding more items  
end

def interactive_menu
  loop do 
    print_menu 
    proccess(STDIN.gets.chomp)  # read the input and save it into a variable
   end
end

def proccess(selection)
  load_students 
  case selection
    when "1" 
      puts "Adding students section"#input the students
      input_students 
    when "2" 
      ask_for_input
      show_students #show the students
    when "3" 
      puts "You have updated succefully the list"
      save_students
    when "4"
      puts "You have loaded succefully the list"
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
    storage_students(name)
    puts "Now we have #{@students.count} " + (@students.count > 1 ? 'students' : 'student')
    puts "Please enter the name of another student :"
    name = STDIN.gets.chomp  #get another name from the user
  end
end

def storage_students(name, cohort = :november)
  @students <<  {name: name, cohort: cohort }
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The student of Villains Academy".center(@withd)
  puts "-------------".center(@withd)
end

def ask_for_input
  puts 'Type "All" to see all the students or a letter A..Z to see the names that starts with:'  
  puts
  puts "Type 'cohort' to see the student grouped by own cohort:"
end

def print_students_list
  if !@students.empty?
    input = gets.chomp
    i = 0
    while i < @students.count
      if input == "cohort" # Students grouped by cohort
        grouped_by_cohorts
        break
      end
      if "#{@students[i][:name]}".start_with?(input.upcase) # print names that starts with a particular letter
        puts "#{(i + 1).to_s}. #{@students[i][:name]} (#{@students[i][:cohort]} cohort)".center(@withd)
      elsif input == "All"
        puts "#{(i + 1).to_s}. #{@students[i][:name]} (#{@students[i][:cohort]} cohort)".center(@withd)
      end
      i += 1
    end
  end
end

def grouped_by_cohorts
  student_by_cohort = {}
  @students.each do |student|
    cohort = student[:cohort]
    if student_by_cohort[cohort] == nil
      student_by_cohort[cohort] = []
    end
    student_by_cohort[cohort].push(student[:name])
  end
  student_by_cohort.each {|key, value| puts "#{key} : " + value.join(", ")}
end


def print_footer
  puts "Overall, we have #{@students.count} " + (@students.count > 1 ? 'students' : 'student')
end

def save_students
  file = File.open("students.csv", "w") #open the file for writing
  @students.each do |student|  #iterate over the array of students
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
   storage_students(name, cohort.to_sym)
  end
  file.close
end

def try_load_students
  filename = ARGV.first #first argument from the command line
  if filename.nil?
     filename = "students.csv"
  end
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end


interactive_menu



