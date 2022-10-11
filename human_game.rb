# frozen_string_literal: true

require 'colorize'
require_relative 'comp_code'

# handles playing the actual game of mastermind if human playing
class HumanGame
  def initialize
    @pegs = Pegs.new
    @keys = Keys.new
    @comp_code = CompCode.new
  end

  def move
    over?
    @guess = 1
    player_turn while @guess < 13
  end

  def choice_valid?
    true if @choice.all?(1..6)
  end

  def convert_choice_to_pegs
    @convert = @choice.map { |number| number - 1 }
  end

  def display_code
    convert_choice_to_pegs
    puts ' '
    print "#{@pegs.pegs[@convert[0]]} #{@pegs.pegs[@convert[1]]} #{@pegs.pegs[@convert[2]]} #{@pegs.pegs[@convert[3]]} "
  end

  def display_keys
    puts 'hi'
  end

  def player_turn
    puts 'Enter a 4 digit code to guess the secret code'
    @choice = gets.chomp.split('').map!(&:to_i)
    if choice_valid? == true
      display_code
      @guess += 1
      win?
      display_keys
    else
      puts 'Please choose a valid 4 digit code'.colorize(:color => :red)
    end
  end

  def win?
    true if @choice == @comp_code
  end

  def over?
    win?
  end

  def play
    move until over?
  end
end
