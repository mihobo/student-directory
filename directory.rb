@students = [] # an empty array accessible to all methods

def print_header
  puts "The students of Villains Academy".center(110)
  puts "--------------------------------".center(110)
end

def print_students_list
  #grouped_by_cohort = @students.sort_by { |student| student[:cohort]}

  #grouped_by_cohort.each_with_index do |student, index|
    # put a month after the == to narrow down to a specific cohort
    #if "#{student[:cohort]}" == " "
    @students.each_with_index do |student, index|
      puts "#{index + 1}: #{student[:name]}, (#{student[:cohort]} cohort, Hobbies: #{student[:hobbies]}, Country: #{student[:country]}, Height: #{student[:height]}, Other: #{student[:other]})".center(110)
    #else
    #  end
    end
end

def print_footer
  if @students.length == 1
    puts "Overall, we have #{@students.count} great student".center(110)
  else
    puts "Overall, we have #{@students.count} great students".center(110)
  end
end


def input_students
  puts "Please enter the name of the student"
  puts "To end data entry, return twice"
  # get the first name
  name = gets.gsub("\n",'')
  # while the name is not empty, repeat this code **
  while !name.empty? do
    puts "Please enter your cohort"
    cohort = gets.delete("\n") # **gsub or delete will both remove the new line
      if cohort.empty?
        cohort = "unknown"
      end
      puts "Please enter their hobbies"
      hobbies = gets.delete("\n")
      if hobbies.empty?
        hobbies = "none"
      end
      puts "Please enter their country of birth"
      country = gets.delete("\n")
      if country.empty?
        country = "unknown"
      end
      puts "Please enter their height"
      height = gets.delete("\n")
      if height.empty?
        height = "unknown"
      end
      puts "Please enter any allergies or none"
      other = gets.delete("\n")
      if other.empty?
        other = "unknown"
      end
    # add the student hash to the array
    @students << {name: name, cohort: cohort, hobbies: hobbies, country: country, height: height, other: other}
    puts ""
      if @students.length == 1
        puts "Now we have #{@students.count} student"
      else
        puts "Now we have #{@students.count} students"
      end
      puts "Please enter another student name"
      puts "To end data entry, return twice"
    # get another name from the user
    name = gets.gsub("\n",'')
  end
  # return the array of students
end


def input_letter(students)
  puts ""
  puts "Please choose a letter to return a list of students beginning with that letter"
  letter = gets.chomp
  puts ""
  spec_students = []
  students.each do |key|
   if key[:name][0] == letter
      spec_students << {name: key[:name], cohort: :november}
    end
  end
  spec_students
end

def char_length(students)
  spec_students = []
  students.each do |key|
   if key[:name].length < 12
      spec_students << {name: key[:name], cohort: :november}
    end
  end
  spec_students
end

def show_results(students)
  while students.count == 0
    puts "No student data found - no list to print"
    puts "Please enter the name of at least 1 student to continue"
    students = input_students
  end
    print_header
    print(students)
    print_footer(students)
end

def interactive_menu
  loop do
    # 1. print the menu and ask the user what they want
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
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
  when "9"
    exit
  else
    puts "Invalid input, try again"
  end
end

def save_students
  #open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:hobbies], student[:country], student[:height], student[:other]]
    csv_line = student_data.join(", ")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort, hobbies, country, height, other = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym, hobbies: hobbies, country: country, height: height, other: other}
  end
  file.close
end

interactive_menu
#students = input_students

#program = show_results(students)

## NO CHANGES##
#print_header
#print(students)
#print_footer(students)

## FIRST LETTER MATCH ##
#spec_students = input_letter(students)
#print_header
#print(spec_students)
#print_footer(spec_students)

## CHAR LENGTH MATCH ##
#spec_students = char_length(students)
#print_header
#print(spec_students)
#print_footer(spec_students)
