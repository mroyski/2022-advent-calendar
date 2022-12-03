# frozen_string_literal: true

file = File.open('input.txt')
input = file.read

elves = input.split("\n").map(&:to_i)
calories = []
sum = 0

# Add sums to array
elves.each do |e|
  if e.positive?
    sum += e
  else
    calories << sum
    sum = 0
  end
end

puts calories.max

# Get top 3 elves carrying the most calories
puts calories.sort.reverse[0..2].sum
