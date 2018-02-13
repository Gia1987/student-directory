# let's put all students into an array
students = [ 
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched", 
  "Micheal Corleone",
  "Alex DeLarge",
  "The Wiched Whitch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Betes",
  ]
# and print them
puts "The student of Villains Academy"
puts "-------------"
students.each do |student|
  puts student
end
# finally, we print the total
puts "Overall, we have #{students.count} great students"
