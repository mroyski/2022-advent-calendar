# frozen_string_literal: true

file = File.open('input.txt')
input = file.read

lower_hash = Hash[('a'..'z').to_a.zip((1..26).to_a)]
upper_hash = Hash[('A'..'Z').to_a.zip((27..52).to_a)]
priorities = lower_hash.merge(upper_hash)

puts priorities

rucksacks = input.split("\n")

# rucksacks = ['vJrwpWtwJgWrhcsFMMfFFhFp']
sum = 0
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

  sum += priorities[shared_item]
end

puts sum
