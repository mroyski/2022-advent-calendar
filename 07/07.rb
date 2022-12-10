# frozen_string_literal: true

file = File.open('input.txt')
input = file.read
lines = input.split("\n")

paths = Hash.new(0)
path = []

lines.each_with_index do |line, _i|
  next if line.split(' ')[1] == 'ls' || line.split(' ')[0] == 'dir'

  if line.split(' ')[1] == 'cd'
    if line.split(' ')[2] == '..'
      path = path[0...-1]
      next
    end
    path.push(line.split(' ')[2])
    next
  end

  size = line.split(' ')[0].to_i

  paths[path.join('/')] += size

  puts "path: #{path.join('/')}, value #{paths[path.join('/')]}"

  next unless path.size > 1

  # pop off path and add to size of folders
  times = 1
  temp_path = path.clone

  while times < path.size
    temp_path.pop
    paths[temp_path.join('/')] += size
    times += 1
  end
end

sum = 0
paths.each do |_k, v|
  sum += v if v <= 100_000
end

puts paths

# Part 1
puts sum
# 1086293

# Part 2
# Total space: 70_000_000
# Space for update: 30_000_000
# "/": 40_358_913
update_space = 30_000_000
used_space = paths['/']
space_to_remove = update_space - (70_000_000 - used_space)
smallest_directory_size = 70_000_000

paths.each do |_k, v|
  smallest_directory_size = v if v >= space_to_remove && v < smallest_directory_size
end

puts smallest_directory_size

# 366028
