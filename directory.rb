@students = [] # an empty array accessible to all methods
@spec_students = []

def print_header
  puts "The students of Villains Academy".center(120)
  puts "--------------------------------".center(120)
end

def print_students_list
  #grouped_by_cohort = @students.sort_by { |student| student[:cohort]}
  #grouped_by_cohort.each_with_index do |student, index|
    # put a month after the == to narrow down to a specific cohort
    #if "#{student[:cohort]}" == " "
    @students.each_with_index do |student, index|
      puts "#{index + 1}: #{student[:name]}, (#{student[:cohort]} cohort, Hobbies: #{student[:hobbies]}, Country: #{student[:country]}, Height: #{student[:height]}, Other: #{student[:other]})".center(120)
    #else
    #  end
    end
end

def print_footer
  word = "students"
  if @students.length == 1
    word = "student"
  end
    puts ("Overall, we have #{@students.count} great " + word).center(120)
end


def input_students
  puts "Please enter the name of the student"
  puts "To end data entry, return twice"
  # get the first name
  name = STDIN.gets.gsub("\n",'')
  # while the name is not empty, repeat this code **
  while !name.empty? do
    puts "Please enter your cohort"
    cohort = STDIN.gets.gsub("\n",'') # **gsub or delete will both remove the new line
      if cohort.empty?
        cohort = "unknown"
      end
      puts "Please enter their hobbies"
      hobbies = STDIN.gets.gsub("\n",'')
      if hobbies.empty?
        hobbies = "none"
      end
      puts "Please enter their country of birth"
      country = STDIN.gets.gsub("\n",'')
      if country.empty?
        country = "unknown"
      end
      puts "Please enter their height"
      height = STDIN.gets.gsub("\n",'')
      if height.empty?
        height = "unknown"
      end
      puts "Please enter any allergies or none"
      other = STDIN.gets.gsub("\n",'')
      if other.empty?
        other = "unknown"
      end
    ## DRY to add_to_students_array method
    # @students << {name: name, cohort: cohort, hobbies: hobbies, country: country, height: height, other: other}
    # add the student hash to the array
    add_to_students_array(name, cohort, hobbies, country, height, other)
    puts ""
    word = "students"
    if @students.length == 1
      word = "student"
    end
      puts "Input data entry successful"
      puts ""
      puts "Now we have #{@students.count} " + word
      puts "Please enter another student name"
      puts "To end data entry, return twice."
    # get another name from the user
    name = STDIN.gets.gsub("\n",'')
  end
  # return the array of students
end


def input_letter(students)
  puts ""
  puts "Please choose a letter to return a list of students beginning with that letter"
  letter = gets.chomp
  puts ""
  students.each do |key|
   if key[:name][0] == letter
      add_to_spec_array(name, cohort)
    end
  end
  @spec_students
end

def char_length(students)
  students.each do |key|
   if key[:name].length < 12
      add_to_spec_array(name, cohort)
    end
  end
  @spec_students
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
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save file"
  puts "4. Load file"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
  puts ""
  puts "List displayed successfully."
  puts ""
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
    puts ""
    puts "Exiting the program. Goodbye"
    exit
  else
    puts ""
    puts "Invalid input, try again"
    puts ""
  end
end

def save_students
  puts "Would you like to add the data to the existing file? Please enter Y or N"
  reply = STDIN.gets.chomp.upcase
    if reply == "Y"
      #open the file for writing
      file = File.open("students.csv", "w")
      #iterate over the array of students
      @students.each do |student|
        student_data = [student[:name], student[:cohort], student[:hobbies], student[:country], student[:height], student[:other]]
        csv_line = student_data.join(",")
        file.puts csv_line
        end
        file.close
        puts "New data added."
    elsif reply == "N"
      puts "Please enter a new filename with no spaces"
      new_file = STDIN.gets.chomp
      file = File.open(new_file, "w")
      @students.each do |student|
        student_data = [student[:name], student[:cohort], student[:hobbies], student[:country], student[:height], student[:other]]
        csv_line = student_data.join(",")
        file.puts csv_line
        end
        file.close
        "New file with new filename created."
    else
      puts "Invalid input"
      save_students
    end
  puts ""
  puts "You have successfully saved your input data."
  puts ""
end

def load_students(filename = "students.csv")
  puts "Do you want to load the default file or load a new file? Please enter D or N "
  @students = []
  reply = STDIN.gets.chomp.upcase
    if reply == "D" && File.exists?(filename) # if it exists
      file = File.open(filename, "r")
      read_lines(file)
    #DRY  file.readlines.each do |line|
    #    name, cohort, hobbies, country, height, other = line.chomp.split(',')
        ## DRY to add_to_students_array method
        # @students << {name: name, cohort: cohort.to_sym, hobbies: hobbies, country: country, height: height, other: other}
    #    add_to_students_array(name, cohort, hobbies, country, height, other)
    #  end
    file.close
      puts "Loaded #{@students.count} from #{filename}"
      puts ""
    elsif reply == "N"
        puts "Please enter the filename you would like to load"
        new_load = STDIN.gets.chomp
        file = File.open(new_load, "r")
        read_lines(file)
    #DRY    file.readlines.each do |line|
    #      name, cohort, hobbies, country, height, other = line.chomp.split(',')
          ## DRY to add_to_students_array method
          # @students << {name: name, cohort: cohort.to_sym, hobbies: hobbies, country: country, height: height, other: other}
    #      add_to_students_array(name, cohort, hobbies, country, height, other)
    #    end
      file.close
        puts "Loaded #{@students.count} from #{filename}"
        puts ""
    else # if it doesn't exist
      puts "Unable to load student data. Please input some student data (option 1) to continue."
  end
end

def read_lines(file)
  file.readlines.each do |line|
    name, cohort, hobbies, country, height, other = line.chomp.split(',')
    add_to_students_array(name, cohort, hobbies, country, height, other)
  end
end

#def try_load_students
#  filename = ARGV.first # first argument from the cmd line
#  return if filename.nil? # get out of the method if not given
#  if File.exists?(filename) # if it exists
#    load_students(filename)
#    puts "Loaded #{@students.count} from #{filename}"
#  else # if it doesn't exist
#    puts "Sorry, #{filename} doesn't exist."
#    exit # quit the program
#  end
#end

def add_to_students_array(name, cohort, hobbies, country, height, other)
  @students << {name: name, cohort: cohort, hobbies: hobbies, country: country, height: height, other: other}
end

def add_to_spec_array(name, cohort)
  @spec_students << {name: key[:name], cohort: :november}
end


#try_load_students
load_students
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
