# frozen_string_literal: true

require 'colorize'

# handles if the computer is guessing and the human makes the code
class CompGame
  def initialize
    @peg = Pegs.new
    @code = Array.new(4) { rand(1..6) }
    @code = [2, 5, 5, 3]
    @total_guesses = 12

    print 'Randomly generated start code: '
    display @code
    puts
  end

  def play
    num = 1
    nums = []
    guess = [num] * 4
    @total_guesses.times do
      print 'Computer guessed: '
      display guess
      puts

      if guess == @code
        puts 'The computer guessed the code correctly.'
        return
      end

      red_pins, = check guess
      (red_pins - nums.length).times { nums << num }

      # add white pins to red pins - nums doesn't include pins when white currently and misses following red pins

      guess = nums.clone
      if guess.length < 4
        num += 1
        (4 - nums.length).times { guess << num }
      else
        guess.shuffle!
      end
    end

    puts 'The computer failed to guess the code.'
  end

  def display(guess)
    guess.each { |i| print "#{@peg.format(i)} " }
  end

  def check(guess)
    h_matches = []
    c_matches = []
    red_pins = 0
    white_pins = 0

    guess.each_index do |i|
      if guess[i] == @code[i]
        red_pins += 1
        h_matches << i
        c_matches << i
      end
    end

    guess.each_index do |i|
      next if h_matches.include?(i)

      @code.each_index do |j|
        next if c_matches.include?(j)

        if guess[i] == @code[j]
          white_pins += 1
          h_matches << i
          c_matches << j
        end
      end
    end

    [red_pins, white_pins]
  end
end
