# frozen_string_literal: true

require 'colorize'
require_relative 'comp_code'

# handles playing the actual game of mastermind if human playing
class HumanGame
  def initialize
    @peg = Pegs.new
    @key = Keys.new
    @computer = CompCode.new
  end

  def move
    over?
    @guess = 1
    player_turn while @guess < 13
  end

  def user_input_valid?
    true if @user_input.all?(1..6)
  end

  def convert_user_input_to_index
    @index = @user_input.map { |number| number - 1 }
  end

  def display_user_code
    convert_user_input_to_index
    print "\n#{@peg.colour[@index[0]]} #{@peg.colour[@index[1]]} #{@peg.colour[@index[2]]} #{@peg.colour[@index[3]]} "
    print '    '
  end

  def display_feedback
    human_matches = []
    computer_matches = []
    @user_input.each_index do |index|
      if @user_input[index] == @computer.random_code[index]
        print @key.red.to_s
        human_matches << index
        computer_matches << index
      end
    end

    @user_input.each_index do |index|
      next if human_matches.include?(index)

      @computer.random_code.each_index do |comp_index|
        next if computer_matches.include?(comp_index)

        if @user_input[index] == @computer.random_code[comp_index]
          print @key.white.to_s
          human_matches << index
          computer_matches << comp_index
        end
      end
    end
  end

  def player_turn
    puts "\n\nEnter a 4 digit code to guess the secret code"
    @user_input = gets.chomp.split('').map!(&:to_i)
    if user_input_valid? == true
      display_user_code
      @guess += 1
      display_feedback
      win
    else
      puts 'Please choose a valid 4 digit code'.colorize(:color => :red)
    end
  end

  def win
    if @user_input == @computer.random_code
      @guess = 13
      puts "\n\nCongratuations you guessed the secret code correctly!\n\n"
    elsif @user_input != @computer.random_code && @guess == 13
      puts "\n\nUnfortunately you didn't crack the secret code this time.\n\n"
      @computer.display_random_code
      puts ' '
    end
  end

  def over?
    win
  end

  def play
    move until over?
  end
end
