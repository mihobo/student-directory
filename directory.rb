def print_header
  puts "The students of Villains Academy".center(110)
  puts "--------------------------------".center(110)
end

def print(students)
    students.each_with_index do |student, index|
    puts "#{index + 1}: #{student[:name]}, (#{student[:cohort]} cohort, Hobbies: #{student[:hobbies]}, Country: #{student[:country]}, Height: #{student[:height]}, Other: #{student[:other]})".center(110)
  end
end

def print_footer(students)
  if students.length == 1
    puts "Overall, we have #{students.count} great student".center(110)
  else
    puts "Overall, we have #{students.count} great students".center(110)
  end
end


def input_students
  puts "Please enter the name of the student"
  puts "To end data entry, return twice"
  #create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Please enter your cohort"
    cohort = gets.chomp
      if cohort.empty?
        cohort = "unknown"
      end
      puts "Please enter their hobbies"
      hobbies = gets.chomp
      if hobbies.empty?
        hobbies = "none"
      end
      puts "Please enter their country of birth"
      country = gets.chomp
      if country.empty?
        country = "unknown"
      end
      puts "Please enter their height"
      height = gets.chomp
      if height.empty?
        height = "unknown"
      end
      puts "Please enter any allergies or none"
      other = gets.chomp
      if other.empty?
        other = "unknown"
      end
    # add the student hash to the array
    students << {name: name, cohort: cohort, hobbies: hobbies, country: country, height: height, other: other}
    puts ""
      if students.length == 1
        puts "Now we have #{students.count} student"
      else
        puts "Now we have #{students.count} students"
      end
      puts "Please enter another student name"
      puts "To end data entry, return twice"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
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

students = input_students
program = show_results(students)

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
