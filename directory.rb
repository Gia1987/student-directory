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
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do 
    # add the student hash to the array
    students <<  {name: name, cohort: :november}
    puts "Now we have #{students.count} student"
    #get another name from the user
    name = gets.chomp
  end
  #return the array of students
  students
end

def print_header
  puts "The student of Villains Academy"
  puts "-------------"
end

def print(students)
  puts 'Type "All" to see all the students, or a letter A..Z to see the names that starts with:'  
  letter = gets.chomp
  i = 0
  while i < students.count
    # print names that starts with a particular letter
    if "#{students[i][:name]}".start_with?(letter.upcase) && "#{students[i][:name]}".length < 12
      puts (i + 1).to_s + ". #{students[i][:name]} (#{students[i][:cohort]} cohort)"
    elsif letter == "All"
      puts (i + 1).to_s + ". #{students[i][:name]} (#{student[i][:cohort]} cohort)"
    end
    i += 1
  end
end

def print_footer(names)
 puts "Overall, we have #{names.count} great students" 
end

students = input_students
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)

