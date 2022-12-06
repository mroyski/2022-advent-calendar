# frozen_string_literal: true

file = File.open('input.txt')
input = file.read

stacks = {}
lines = input.split("\n\n")[0].split("\n")
lines.each do |line|
  crates = line.scan(/.{1,4}/)

  crates.each_with_index do |crate, index|
    next if crate.strip.empty?

    stacks[index + 1] = [] unless stacks.key?(index + 1)
    stacks[index + 1].unshift crate[1]
  end
end

commands = input.split("\n\n")[1].split("\n")

commands.each do |command|
  todo = command.split(' ')

  count = todo[1].to_i
  from = todo[3].to_i
  to = todo[5].to_i

  case ARGV[-1]
  when '1'
    count.times do
      crate = stacks[from].pop
      stacks[to].push(crate)
    end
  when '2'
    crates = stacks[from].pop(count)
    stacks[to].concat(crates)
  end
end

ordered_keys = stacks.keys.sort

result = ''
ordered_keys.each do |key|
  result += stacks[key][-1]
end

# Part 1: FRDSQRRCD
# Part 2: HRFTQVWNN
puts result
