# frozen_string_literal: true

file = File.open('input.txt')
input = file.read.split("\n")

visible_trees = input.size * 2 + input[0].size * 2 - 4
max_scenic_score = 0

input.each_with_index do |line, i|
  next if i.zero? || i == input.size - 1

  heights = line.split('').map(&:to_i)

  heights.each_with_index do |tree, j|
    next if j.zero? || j == heights.size - 1

    vertical = input.map { |t| t[j].to_i }
    above = vertical[0...i]
    below = vertical[(i + 1)..]
    left = heights[0...j]
    right = heights[(j + 1)..]

    above_max = above.max
    below_max = below.max
    left_max = left.max
    right_max = right.max

    visible_trees += 1 if tree > left_max || tree > right_max || tree > above_max || tree > below_max

    # Part 2

    above_view = tree > above_max ? above.size : above.reverse.index { |v| v >= tree }.to_i + 1
    below_view = tree > below_max ? below.size : below.index { |v| v >= tree }.to_i + 1

    left_view = tree > left_max ? j : left.reverse.index { |v| v >= tree }.to_i + 1
    right_view = tree > right_max ? line.size - j - 1 : right.index { |v| v >= tree }.to_i + 1

    score = above_view * below_view * left_view * right_view
    max_scenic_score = score > max_scenic_score ? score : max_scenic_score
  end
end

puts visible_trees
# 1816

puts max_scenic_score
# 383520
