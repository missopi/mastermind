# frozen_string_literal: true

require 'colorize'

# handles if the computer is guessing and the human makes the code
class CompGame
  def initialize
    @peg = Pegs.new
    puts 'Choose a 4 digit code for the computer to guess.'
    @user_input = gets.chomp.split('').map!(&:to_i)
    @total_guesses = 12
    display @user_input
    puts
  end

  def play
    number = 1
    numbers = []
    guess = [number] * 4
    @total_guesses.times do
      print "\nThe computer guessed: "
      display guess
      puts

      if guess == @user_input
        puts "\nThe computer guessed the code correctly.\n\n"
        return
      end

      # code to keep track of how many red & white keys the guess has so the computer
      # knows to keep hold of numbers it's previously guessed correctly

      red_keys, white_keys = check guess
      ((red_keys + white_keys) - numbers.length).times { numbers << number }

      guess = numbers.clone
      if guess.length < 4
        number += 1
        (4 - numbers.length).times { guess << number }
      else
        guess.shuffle!
      end
    end

    puts "\nThe computer failed to guess the code.\n\n"
  end

  def display(guess)
    guess.each { |i| print "#{@peg.format(i)} " }
  end

  # method to loop through the guess and find any matches so it can assign red and white keys to them

  def check(guess)
    h_matches = []
    c_matches = []
    red_keys = 0
    white_keys = 0

    guess.each_index do |i|
      if guess[i] == @user_input[i]
        red_keys += 1
        h_matches << i
        c_matches << i
      end
    end

    guess.each_index do |i|
      next if h_matches.include?(i)

      @user_input.each_index do |j|
        next if c_matches.include?(j)

        if guess[i] == @user_input[j]
          white_keys += 1
          h_matches << i
          c_matches << j
        end
      end
    end

    [red_keys, white_keys]
  end
end
