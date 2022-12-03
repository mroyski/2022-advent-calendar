# frozen_string_literal: true

# Column 1
# A: Rock
# B: Paper
# C: Scissors

# Column 2
# X: Rock
# Y: Paper
# Z: Scissors

# Points
# 1: Rock
# 2: Paper
# 3: Scissors

# 0: Lost
# 3: Draw
# 6: Win

file = File.open('input.txt')
input = file.read

rounds = input.split("\n")

winning_throw = {
  A: 'Z',
  B: 'X',
  C: 'Y',
  X: 'C',
  Y: 'A',
  Z: 'B'
}

equal_values = {
  A: 'X',
  B: 'Y',
  C: 'Z',
  X: 'A',
  Y: 'B',
  Z: 'C'
}

loss_throw = {
  A: 'Y',
  B: 'Z',
  C: 'X',
  X: 'B',
  Y: 'C',
  Z: 'A'
}

throw_value = {
  A: 1,
  B: 2,
  C: 3,
  X: 1,
  Y: 2,
  Z: 3
}

result_value = {
  loss: 0,
  draw: 3,
  win: 6
}

score1 = 0

# Part 1
rounds.each do |r|
  throws = r.split(' ')
  opponent = throws[0]
  me = throws[1].to_sym

  win = winning_throw[me] == opponent

  score1 += if win
              result_value[:win] + throw_value[me]
            elsif equal_values[me] == opponent
              result_value[:draw] + throw_value[me]
            else
              throw_value[me]
            end
end

# 12535
puts "score1: #{score1}"

game_result = {
  X: :loss,
  Y: :draw,
  Z: :win
}

# Part 2
score2 = 0
rounds.each do |r|
  throws = r.split(' ')
  opponent = throws[0].to_sym
  me = throws[1].to_sym

  # w/l/d score
  score2 += result_value[game_result[me]]

  # get my throw score
  case me
  when :X
    score2 += throw_value[winning_throw[opponent].to_sym]
  when :Y
    score2 += throw_value[opponent]
  when :Z
    score2 += throw_value[loss_throw[opponent].to_sym]
  end
end

# 15457
puts "score2: #{score2}"
