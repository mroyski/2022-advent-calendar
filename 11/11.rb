# frozen_string_literal: true

class Monkey
  attr_accessor :id, :items, :operation, :test_num, :true_throw, :false_throw, :inspect_count

  @@old = 0
  @@monkeys = []

  def self.all_monkeys
    @@monkeys
  end

  def initialize(id, items, operation, test_num, true_throw, false_throw)
    @id = id
    @items = items
    @operation = operation
    @test_num = test_num
    @true_throw = true_throw
    @false_throw = false_throw
    @inspect_count = 0
    @@monkeys << self
  end

  def inspect
    @items.each_with_index do |item, _index|
      @inspect_count += 1
      @@old = item
      worry_level = operate
      worry_level /= 3

      #   puts "monkey: #{@id}, item: #{item}, worry: #{worry_level}"

      if worry_level % test_num == 0
        # puts "throw to monkey #{@true_throw}"
        @@monkeys[@true_throw].items.push(worry_level)
      else
        # puts "throw to monkey #{@false_throw}"
        @@monkeys[@false_throw].items.push(worry_level)
      end
    end
    @items.clear
  end

  def operate
    arr = @operation.split(' ').map do |item|
      case item
      when 'old'
        @@old
      when '*', '/', '+', '-'
        item
      else
        item.to_i
      end
    end

    arr[0].public_send(arr[1], arr[2])
  end
end

file = File.open('input.txt')
input = file.read.split("\n\n")

# Monkey.new(0, [79, 98], 'old * 19', 23, 2, 3)
# Monkey.new(1, [54, 65, 75, 74], 'old + 6', 19, 2, 0)
# Monkey.new(2, [79, 60, 97], 'old * old', 13, 1, 3)
# Monkey.new(3, [74], 'old + 3', 17, 0, 1)

Monkey.new(0, [54, 82, 90, 88, 86, 54], 'old * 7', 11, 2, 6)
Monkey.new(1, [91, 65], 'old * 13', 5, 7, 4)
Monkey.new(2, [62, 54, 57, 92, 83, 63, 63], 'old + 1', 7, 1, 7)
Monkey.new(3, [67, 72, 68], 'old * old', 2, 0, 6)
Monkey.new(4, [68, 89, 90, 86, 84, 57, 72, 84], 'old + 7', 17, 3, 5)
Monkey.new(5, [79, 83, 64, 58], 'old + 6', 13, 3, 0)
Monkey.new(6, [96, 72, 89, 70, 88], 'old + 4', 3, 1, 2)
Monkey.new(7, [79], 'old + 8', 19, 4, 5)

20.times do
  Monkey.all_monkeys.each do |m|
    m.inspect
  end
end

Monkey.all_monkeys.each do |m|
  puts "monkey #{m.id}: #{m.inspect_count}"
end

top_two_inspections = Monkey.all_monkeys.map(&:inspect_count).sort.reverse[0..1]

# 78960
puts top_two_inspections.reduce(:*)
