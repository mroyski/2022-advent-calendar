# frozen_string_literal: true

file = File.open('input.txt')
input = file.read

rows = input.split("\n")
contained_pairs = 0

# Part 1
rows.each do |row|
  sections = row.split(',')
  left_section = sections[0]
  right_section = sections[1]

  left_nums = sections[0].split('-')
  right_nums = sections[1].split('-')

  left_low = left_nums[0].to_i
  left_high = left_nums[1].to_i
  right_low = right_nums[0].to_i
  right_high = right_nums[1].to_i

  if (left_low >= right_low && left_high <= right_high) || (right_low >= left_low && right_high <= left_high)
    contained_pairs += 1
  end
end

# 582
puts contained_pairs

overlapping_pairs = 0
# Part 2
rows.each do |row|
  sections = row.split(',')
  left_section = sections[0]
  right_section = sections[1]

  left_nums = sections[0].split('-')
  right_nums = sections[1].split('-')

  left_low = left_nums[0].to_i
  left_high = left_nums[1].to_i
  right_low = right_nums[0].to_i
  right_high = right_nums[1].to_i

  next unless left_low.between?(right_low, right_high) ||
              left_high.between?(right_low, right_high) ||
              right_low.between?(left_low, left_high) ||
              right_high.between?(left_low, left_high)

  overlapping_pairs += 1
end

# 893
puts overlapping_pairs