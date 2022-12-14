# frozen_string_literal: true

class Cycle
  attr_accessor :val, :ticks

  def initialize(val)
    @val = val
    @ticks = 2
  end
end

file = File.open('input.txt')
input = file.read.split("\n")

# Part 1

process = []
cycles = {}
x = 1
sum = 0

process = input.map do |i|
  i == 'noop' ? nil : Cycle.new(i.split(' ')[1].to_i)
end

c = 1
while process.size > 0
  sum += c * x if [20, 60, 100, 140, 180, 220].include?(c)

  p = process[0]

  if p.nil?
    process.shift
    c += 1
    next
  end

  p.ticks -= 1

  if p.ticks == 0
    x += p.val
    process.shift
  end

  c += 1
end

# 14420
puts sum

process = input.map do |i|
  i == 'noop' ? nil : Cycle.new(i.split(' ')[1].to_i)
end

rows = []

6.times do
  rows.push([])
end

rows.each do |r|
  40.times do
    r.push '.'
  end
end

x = 1
row = 0
position = 0

while process.size > 0
  if [40, 80, 120, 160, 200].include?(position)
    row += 1
    position = 0
  end

  rows[row][position] = '#' if [x - 1, x, x + 1].include?(position)

  if process[0].nil?
    process.shift
  else
    process[0].ticks -= 1
    if process[0].ticks == 0
      x += process[0].val
      process.shift
    end
  end
  position += 1
end

# RGLRBZAU
rows.each_with_index do |r, i|
  puts "#{i}: #{r.join}"
end
