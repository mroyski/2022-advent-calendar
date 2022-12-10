# frozen_string_literal: true

file = File.open('input.txt')
input = file.read.split("\n")

visible_trees = input.size * 2 + input[0].size * 2 - 4
input.each_with_index do |line, i|
  next if i.zero? || i == input.size - 1

  heights = line.split('').map(&:to_i)
  heights.each_with_index do |tree, j|
    next if j.zero? || j == heights.size - 1

    left_max = heights[0...j].max
    right_max = heights[(j + 1)..].max

    vertical = input.map { |t| t[j].to_i }
    above_max = vertical[0...i].max
    below_max = vertical[(i + 1)..].max

    visible += 1 if tree > left_max || tree > right_max || tree > above_max || tree > below_max
  end
end


puts visible_trees
# 1816
