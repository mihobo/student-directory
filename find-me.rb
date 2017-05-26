file = $0

"Hey, you've found me. Congrats! I'm reading myself reading myself...continuously"

File.open(file, "r") do |file|
  file.each_line do |line|
    puts line
  end
end
