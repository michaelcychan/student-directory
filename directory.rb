require 'csv' # calling the CSV library

# Creating global array for every methods to use
@students = []
$text_width = 35
@filename = ""

def import_student(name, cohort, cob, lang)
  @students << {name: name, cohort: cohort.to_sym, cob: cob.to_sym, lang: lang.to_sym}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    puts "Which cohort?"
    cohort = STDIN.gets.chomp
    puts "Country of birth?"
    cob = STDIN.gets.chomp
    puts "Favourite coding language?"
    lang = STDIN.gets.chomp
    import_student(name, cohort, cob, lang)
    puts "Now we have #{@students.count} students" if @students.count > 1
    puts "Now we have 1 student" if @students.count == 1
    # get another name from the user
    puts "Please enter another student's name (Leave blank and press enter to finish)"
    name = STDIN.gets.chomp
  end
end

# defining actions
def print_header
  puts "The students of Villains Academy".center($text_width,'-')
  puts "-".center($text_width,'-')
end

def print_student_list
    @students.each_with_index do |student, ind|
    puts "#{ind + 1}: #{student[:name]} (#{student[:cohort]} cohort)".center($text_width,'-')
    puts "Country of Birth: #{student[:cob]}".center($text_width, '-')
    puts "Favourite coding language: #{student[:lang]}".center($text_width,'-')
  end
  puts "-".center($text_width,'-')
end

def print_while
  counter = 0
  while counter < @students.length do
    puts "#{counter + 1}: #{@students[counter][:name]} (#{@students[counter][:cohort]} cohort). Country of Birth: #{names[counter][:cob]}; Favourite coding language: #{names[counter][:lang]}"
    counter += 1
  end
end

def printgroup_lang
  groupbylang = Hash.new
  @students.map do |student|
    groupbylang[student[:lang].to_sym] = [] if groupbylang[student[:lang].to_sym] == nil
    groupbylang[student[:lang].to_sym].push(student[:name])
  end
  groupbylang.each do |k, v|
    puts "Having #{k} as the favourite coding language: #{v}."
  end
end

def printgroup_cob
  groupbycob = Hash.new
  @students.map do |student|
    groupbycob[student[:cob].to_sym] = [] if groupbycob[student[:cob].to_sym] == nil
    groupbycob[student[:cob].to_sym].push(student[:name])
  end
  groupbycob.each do |k, v|
    puts "#{k} as country of birth: #{v}."
  end
end

def printgroup_cohort
  groupbycohort = Hash.new
  @students.map do |student|
    groupbycohort[student[:cohort].to_sym] = [] if groupbycohort[student[:cohort].to_sym] == nil
    groupbycohort[student[:cohort].to_sym].push(student[:name])
  end
  groupbycohort.each do |k, v|
    puts "Cohort #{k}: #{v}."
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students" if @students.count > 1
  puts "Now, we have 1 student" if @students.count == 1
  puts "We currently do not have any student" if @students.count == 0
end

def print_special_names
  puts "The names of the below students starts with 'A', 'M', or 'L'; and is less than 6 characters"
  @students.each do |student|
    puts student[:name] if student[:name][0].match(/[AML]/) && student[:name].length < 6
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def get_filename
  puts "Please enter file name: "
  puts "leave blank to use default file (students.csv)"
  @filename = STDIN.gets.chomp
  @filename = "students.csv" if @filename == ""
end

def save_students
  # opening file for writing ("w")
  file = File.open(@filename, "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:cob], student[:lang]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "#{@students.count} students successfully written to #{@filename}."
end

def load_students 
  # Using CSV library to read file:
  CSV.foreach((@filename), col_sep: ",") do |line|
    name, cohort, cob, lang = line
    import_student(name, cohort, cob, lang)
  end

  # # the r indicates it is for reading the file
  # file = File.open(@filename, "r")
  # file.readlines.each do |line|
  #   name, cohort, cob, lang = line.split(",")
  #   import_student(name, cohort, cob, lang)
  # end
  # file.close

  puts "#{@filename} successfully loaded."
end

def try_load_students
  @filename = ARGV.first
  @filename = "students.csv" if (@filename.nil? || @filename == "") # use default file
  if File.exist?(@filename) # file exists
    load_students
    puts "Loaded #{@students.count} students from #{@filename}"
  else # file does not exist
    puts "Sorry, #{@filename} does not exist."
    exit
  end
end

def print_menu
  puts "1. Input students details"
  puts "2. Show the current students"
  puts "3. Save the list to #{@filename}"
  puts "4. Load the list from #{@filename}"
  puts "5. Change save filename"
  puts "9. Exit"
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "5"
    get_filename
  when "9"
    exit
  else
    puts "I can't understand, please enter the correct number."
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

try_load_students
interactive_menu

=begin
# Methods to be incorporated (need to remove arguments):

print_special_names(students)
puts "-".center(50, '-')
printgroup_lang(students)
puts "-".center(50, '-')
printgroup_cohort(students)
puts "-".center(50, '-')
printgroup_cob(students)
puts "-".center(50, '-')

# Unused methods:
# print_while(students)

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