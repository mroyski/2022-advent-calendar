# frozen_string_literal: true

class Knot
  attr_accessor :x, :y

  def initialize
    @x = 0
    @y = 0
  end

  def move(direction)
    case direction
    when 'R'
      @x += 1
    when 'L'
      @x -= 1
    when 'U'
      @y += 1
    when 'D'
      @y -= 1
    end
  end

  def follow(knot)
    x_distance = (knot.x - @x).abs
    y_distance = (knot.y - @y).abs
    distance = [x_distance, y_distance].max

    if distance > 1
      x_direction = knot.x - @x
      y_direction = knot.y - @y

      @x += x_distance == 2 ? x_direction / 2 : x_direction
      @y += y_distance == 2 ? y_direction / 2 : y_direction
    end
  end
end

file = File.open('input.txt')
input = file.read.split("\n")

# Part 1
visits = Hash.new(0)
@tail = Knot.new
@head = Knot.new

input.each do |line|
  line.split(' ')[1].to_i.times do
    @head.move(line.split(' ')[0])
    @tail.follow(@head)

    visits["#{@tail.x},#{@tail.y}"] += 1
  end
end

# 6642
puts visits.size

#Part 2

knots = {}
knot_num = 1
10.times do
  knots[knot_num] = Knot.new
  knot_num += 1
end

visits = Hash.new(0)
@tail = Knot.new
@head = Knot.new

input.each do |line|
  line.split(' ')[1].to_i.times do
    knots.each do |key, val|
      if key == 1
        val.move(line.split(' ')[0])
        next
      end
      val.follow(knots[key - 1])

      visits["#{val.x},#{val.y}"] += 1 if key == 10
    end
  end
end

# 2765
puts visits.size