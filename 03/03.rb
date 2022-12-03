# frozen_string_literal: true

file = File.open('input.txt')
input = file.read

lower_hash = Hash[('a'..'z').to_a.zip((1..26).to_a)]
upper_hash = Hash[('A'..'Z').to_a.zip((27..52).to_a)]
priorities = lower_hash.merge(upper_hash)

rucksacks = input.split("\n")

# Part 1
sum1 = 0
rucksacks.each do |r|
  mid = r.size / 2
  comp1 = r[0..mid - 1]
  comp2 = r[mid..]

  shared_item = nil
  index = 0

  while index < mid
    if comp2.include?(comp1[index])
      shared_item = comp1[index]
      break
    end
    index += 1
  end

  sum1 += priorities[shared_item]
end

# 7903
puts sum1

# Part 2
sum2 = 0
elf_groups = rucksacks.each_slice(3).to_a

elf_groups.each do |group|
  sack_sizes = group.map(&:size)
  largest_sack = sack_sizes.max
  to_iterate = sack_sizes.index(largest_sack)

  shared_item = nil

  group[to_iterate].split('').each do |char|
    shared_count = 0

    group.each do |str|
      shared_count += 1 if str.include?(char)
      if shared_count == 3
        shared_item = char
        break
      end
    end
  end
  sum2 += priorities[shared_item]
end

# 2548
puts sum2
