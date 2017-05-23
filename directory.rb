def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
    students.each_with_index do |student, index|
    puts "#{index + 1}: #{student[:name]}, (#{student[:cohort]} cohort, Hobbies: #{student[:hobbies]}, Country: #{student[:country]}, Height: #{student[:height]}, Other: #{student[:other]})"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
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
    puts "Please enter their hobbies"
    hobbies = gets.chomp
    puts "Please enter their country of birth"
    country = gets.chomp
    puts "Please enter their height"
    height = gets.chomp
    puts "Please enter anything else required or none"
    other = gets.chomp
    # add the student hash to the array
    students << {name: name, cohort: :november, hobbies: hobbies, country: country, height: height, other: other}
    puts ""
    puts "Now we have #{students.count} students"
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

students = input_students

## NO CHANGES##
print_header
print(students)
print_footer(students)

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
