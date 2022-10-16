# frozen_string_literal: true

require 'colorize'

# handles if the computer is guessing and the human makes the code
class CompGame
  def initialize
    @peg = Pegs.new
  end

  def move
    over?
    @guess = 1
    computer_turn while @guess < 13
  end

  def user_input_valid?
    true if @user_input.all?(1..6)
  end

  def computer_first_guess
    @comp_random_code = [rand(1..6), rand(1..6), rand(1..6), rand(1..6)]
  end

  def convert_guess_to_index
    @index = @comp_random_code.map { |number| number - 1 }
  end

  def display_guess
    convert_guess_to_index
    print "\nThe computer chose: "
    print "#{@peg.colour[@index[0]]} #{@peg.colour[@index[1]]} #{@peg.colour[@index[2]]} #{@peg.colour[@index[3]]}\n"
  end

  def computer_turn
    computer_first_guess
    display_guess
    @guess += 1
    win
  end

  def start
    puts "\nChoose a 4 digit code for the computer to try and guess"
    @user_input = gets.chomp.split('').map!(&:to_i)
    if user_input_valid? == true
      move
    else
      puts 'Please choose a valid 4 digit code'.colorize(:color => :red)
    end
  end

  def win
    if @comp_random_code == @user_input
      @guess = 13
      puts "\nThe computer guessed the code correctly."
    elsif @comp_random_code != @user_input && @guess == 13
      puts "\nThe computer failed to guess the code."
    end
  end

  def over?
    win
  end
end
