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
