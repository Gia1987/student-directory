@students = [] # an empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the lidt to students.csv"
  puts "4. Load list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items  
end

def interactive_menu
  loop do 
    print_menu
    #2. read the input and save it into a variable
    proccess(STDIN.gets.chomp)
    #3. do what the user has asked
   end
end

def proccess(selection)
  case selection
    when "1"
    #input the students
      input_students
    when "2"
    #show the students
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit #this will couse the program to terminate
    else
      puts " I don't know you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "to finish, just hit return twice"
  #create an empty array
  #get the first name
  name = STDIN.gets.chomp
  if name.empty?
    puts "There is not any student on the list!"
  end
  # while the name is not empty, repeat this code
  while !name.empty? do 
    # add the student hash to the array
    puts "What cohort are you part of ?"
    cohort = gets.chomp
    if cohort == ""
      cohort = "february" 
    end
    storage_students(name, cohort)
    puts "Now we have #{@students.count} " + (@students.count > 1 ? 'students' : 'student')
    #get another name from the user
    name = STDIN.gets.chomp
  end
end

def storage_students(name, cohort)
  @students <<  {name: name, cohort: cohort.to_sym }
end
def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The student of Villains Academy"
  puts "-------------"
end

def ask_for_input
  puts 'Type "All" to see all the students or a letter A..Z to see the names that starts with:'  
  puts "Type 'cohort' to see the student grouped by own cohort:"
end

def print_students_list
  if !@students.empty?
    ask_for_input
    input = gets.chomp
    i = 0
    while i < @students.count
      # Students grouped by cohort
      if input == "cohort"
        grouped_by_cohorts
        break
      end
      # print names that starts with a particular letter
      if "#{@students[i][:name]}".start_with?(input.upcase)
        puts "#{(i + 1).to_s}. #{@students[i][:name]} (#{@students[i][:cohort]} cohort)".center(120,)
      elsif input == "All"
        puts "#{(i + 1).to_s}. #{@students[i][:name]} (#{@students[i][:cohort]} cohort)".center(120,)
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
  #open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of students
  @students.each do |student|
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
   storage_students(name, cohort)
  end
  file.close
end

def try_load_students
  filename = ARGV.first# first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

try_load_students
interactive_menu



