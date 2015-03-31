@buffer = ""
def input(integer)
  if @buffer.length == 0
    @buffer = $stdin.gets
  end
  if integer
    while true
      match = /^[^0-9+-]*([+-]?\d+)(.*)$/m.match @buffer
      break if match
      @buffer = $stdin.gets
    end
    value = match[1].to_i
    @buffer = match[2]
  else
    value = @buffer[0]
    @buffer = @buffer[1..-1]
  end
  value
end

filename = ARGV.first
storage = Hash.new
stack = Array.new

code = File.read(filename).split("\n")
pointer = 0
label_map = Hash.new
code.each_with_index do |c, i|
  label = c.split(" ", 2)[0]
  label = label.gsub(":", "").to_i
  label_map[label] = i
end

while pointer < code.size
  label, command, direction, variable = code[pointer].split(" ", 4)
  number = command[2..-1].to_i
  case command[0]
  when "A"
    storage[variable] = number
  when "I"
    value = input(number % 2 == 1)
    storage[variable] = value
  when "O"
    value = storage[variable].to_i
    if number % 2 == 0
      putc value
    else
      print value
    end
  when "P"
    if direction == "From"
      stack.push storage[variable]
    else
      storage[variable] = stack.pop.to_i
    end
  when "C"
    value1 = stack.pop.to_i
    value2 = stack.pop.to_i
    value = case number % 5
      when 0 then value2 + value1
      when 1 then value2 - value1
      when 2 then value2 * value1
      when 3 then value2 / value1
      when 4 then value2 % value1
    end
    storage[variable] = value
  when "B"
    value = stack.pop.to_i
    if value > 0
      pointer = label_map[number] - 1
    end
  end
  pointer += 1
end
puts
