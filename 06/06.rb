# frozen_string_literal: true

file = File.open('input.txt')
input = file.read.split('')

# Part 1
index = 0

while true
  if input[index...index + 4].uniq.size == 4
    puts index + 4
    break
  end
  index += 1
end

# 1760

# Part 2
index = 0

while true
  if input[index...index + 14].uniq.size == 14
    puts index + 14
    break
  end
  index += 1
end

# 2974
