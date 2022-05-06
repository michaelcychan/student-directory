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
    puts "Which cohort?"
    cohort = gets.chomp
    puts "Country of birth?"
    cob = gets.chomp
    puts "Favourite coding language?"
    lang = gets.chomp
    students << {name: name, cohort: cohort.to_sym, cob: cob.to_sym, lang: lang.to_sym}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

$text_width = 50

# defining actions
def print_header
  puts "The students of Villains Academy".center($text_width,'-')
  puts "-".center($text_width,'-')
end

def print(names)
  names.each_with_index do |name, ind|
    puts "#{ind + 1}: #{name[:name]} (#{name[:cohort]} cohort)".center($text_width,'-')
    puts "Country of Birth: #{name[:cob]}".center($text_width, '-')
    puts "Favourite coding language: #{name[:lang]}".center($text_width,'-')
  end
  puts "-".center($text_width,'-')
end

def print_while(names)
  counter = 0
  while counter < names.length do
    puts "#{counter + 1}: #{names[counter][:name]} (#{names[counter][:cohort]} cohort). Country of Birth: #{names[counter][:cob]}; Favourite coding language: #{names[counter][:lang]}"
    counter += 1
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
print_while(students)
print_footer(students)
print_special_names(students)
