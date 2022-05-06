=begin
# students name in an array
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]
=end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end


# defining actions
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(names)
  names.each_with_index do |name, ind|
    puts "#{ind + 1}: #{name[:name]} (#{name[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def print_special_names(names)
  puts "The names of the below students starts with 'A', 'M', or 'L'; and is less than 6 characters"
  names.each do |name|
    puts name[:name] if name[:name][0].match(/[AML]/) && name[:name].length < 6
  end
end

students = input_students
print_header
print(students)
print_footer(students)
print_special_names(students)
