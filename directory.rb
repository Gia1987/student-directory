# let's put all students into an array
students = [ 
  { name: "Dr. Hannibal Lecter", cohort: :movember},
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
def print_header
  puts "The student of Villains Academy"
  puts "-------------"
end
def print(students)
  students.each do |student|
  puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end
def print_footer(names)
 puts "Overall, we have #{names.count} great students" 
end
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)

