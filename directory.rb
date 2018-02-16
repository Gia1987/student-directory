=begin
# let's put all students into an array
students = [ 
  {name:"Dr. Hannibal Lecter", cohort: :movember},
  {name:"Darth Vader", cohort: :movember},
  {name:"Nurse Ratched", cohort: :movember},
  {name:"Micheal Corleone", cohort: :movember},
  {name:"Alex DeLarge", cohort: :movember},
  {name:"The Wiched Whitch of the West", cohort: :movember},
  {name:"Terminator", cohort: :movember},
  {name:"Freddy Krueger", cohort: :movember},
  {name:"The Joker", cohort: :movember},
  {name:"Joffrey Baratheon", cohort: :movember},
  {name:"Norman Betes", cohort: :movember}
  ]
=end
=begin
students = [
    "Dr. Hannibal Lecter",
    "Darth Vader",
    "Nurse Ratched",
    "Michael Corleone",
    "Alex DeLarge",
    "The Wicked Witch of the West",
    "Terminator",
    "Freddy Krueger",
    "The Joker",
    "Joffrey Baratheon",
    "Norman Bates"
]
=end
def input_students
  puts "Please enter the names of the students"
  puts "to finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = gets.chop
  if name.empty?
      puts "There is not any student on the list!"
  end
  # while the name is not empty, repeat this code
  while !name.empty? do 
    # add the student hash to the array
    puts "What cohort are you part of ?"
    month = gets.chop
      if month == ""
        month = "february" 
      end
    puts "Add the hobbies"
    hobby = gets.chop
    puts "Add country"
    country = gets.chop
    puts "Add height (cm)"
    height = gets.chop
    students <<  {name: name, cohort: month, hobbies: hobby, origin: country, height: height}
    puts "Now we have #{students.count} student"
    #get another name from the user
    name = gets.chop
  end
  #return the array of students
  students
end

def interactive_menu
  students = []
  loop do 
    #1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # 9 because we'll be adding more items
    #2. read the input and save it into a variable
    selection = gets.chop
    #3. do what the user has asked
    case selection
    when "1"
      #input the students
      students = input_students
    when "2"
      #show the students
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit #this will couse the program to terminate
    else
      puts " I don't know you meant, try again"
    end
  end
end

def print_header
  puts "The student of Villains Academy"
  puts "-------------"
end

def print(students)
  if !students.empty?
    puts 'Type "All" to see all the students or a letter A..Z to see the names that starts with:'  
    puts "Type 'cohort' to see the student grouped by own cohort:"
    input = gets.chop
    i = 0
    while i < students.count
      # Students grouped by cohort
      if input == "cohort"
        student_by_cohort = {}
        students.each do |student|
          cohort = student[:cohort]
          if student_by_cohort[cohort] == nil
             student_by_cohort[cohort] = []
          end
          student_by_cohort[cohort].push(student[:name])
        end
        student_by_cohort.each {|key, value| puts "#{key} : " + value.join(", ")}
        break
      end
      # print names that starts with a particular letter
      if "#{students[i][:name]}".start_with?(input.upcase) && "#{students[i][:name]}".length < 12
        puts "#{(i + 1).to_s}.  #{students[i][:name]} (#{students[i][:cohort]} cohort), who loves #{students[i][:hobbies]}, comes from #{students[i][:origin]} and also is  #{students[i][:height]} cm tall.".center(150,"-")
      elsif input == "All"
        puts "#{(i + 1).to_s}.  #{students[i][:name]} (#{students[i][:cohort]} cohort), who loves #{students[i][:hobbies]}, comes from #{students[i][:origin]} and also is  #{students[i][:height]} cm tall.".center(150,"-")
      end
      i += 1
    end
  end
end

def print_footer(names)
  if names.count == 1
    puts "Overall, we have #{names.count} student"
  else
    puts "Overall, we have #{names.count} great students" 
  end
end

interactive_menu
students = input_students
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)

