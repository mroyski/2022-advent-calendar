# frozen_string_literal: true

file = File.open('input.txt')
input = file.read.split("\n")
visits = Hash.new(0)
@head = { x: 0, y: 0 }
@tail = { x: 0, y: 0 }

def tail_stays?
  ((@tail[:x] - 1)..(@tail[:x] + 1)).include?(@head[:x]) &&
    ((@tail[:y] - 1)..(@tail[:y] + 1)).include?(@head[:y])
end

def tail_position
  "#{@tail[:x]},#{@tail[:y]}".to_sym
end

visits[tail_position] += 1

input.each do |line|
  direction = line.split(' ')[0]
  move_times = line.split(' ')[1].to_i

  move_times.times do
    case direction
    when 'R'
      @head[:x] += 1

      next if tail_stays?

      @tail[:y] = @head[:y] if @tail[:y] != @head[:y]

      @tail[:x] = @head[:x] - 1
      visits[tail_position] += 1
    when 'L'
      @head[:x] -= 1

      next if tail_stays?

      @tail[:y] = @head[:y] if @tail[:y] != @head[:y]

      @tail[:x] = @head[:x] + 1
      visits[tail_position] += 1
    when 'U'
      @head[:y] += 1

      next if tail_stays?

      @tail[:x] = @head[:x] if @tail[:x] != @head[:x]

      @tail[:y] = @head[:y] - 1
      visits[tail_position] += 1
    when 'D'
      @head[:y] -= 1

      next if tail_stays?

      @tail[:x] = @head[:x] if @tail[:x] != @head[:x]

      @tail[:y] = @head[:y] + 1
      visits[tail_position] += 1
    end
  end
end

puts visits.size

# 6642 TOO HIGH
