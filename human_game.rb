# frozen_string_literal: true

require 'colorize'

# handles playing the actual game of mastermind if human playing
class HumanGame
  def initialize
    @pegs = Pegs.new
    @keys = Keys.new
  end

  def computer_gen_code
    @comp_code = [rand(1..6), rand(1..6), rand(1..6), rand(1..6)]
  end

  def player_choice
    puts 'Enter a 4 digit code to guess the secret code'
    @choice = gets.split('').to_a
    @choice.pop # removes carriage return rom array
    @choice.map!(&:to_i)
  end

  def choice_valid?
    true if @choice.all?(1..6)
  end

  def convert_choice_to_pegs
    @convert = @choice.map { |number| number - 1 }
  end

  def display_code
    puts ' '
    puts "#{@pegs.pegs[@convert[0]]} #{@pegs.pegs[@convert[1]]} #{@pegs.pegs[@convert[2]]} #{@pegs.pegs[@convert[3]]}"
    puts
  end

  def move
    over?
    @turn = 1
    player_turn while @turn < 13
  end

  def player_turn
    player_choice
    if choice_valid? == true
      convert_choice_to_pegs
      display_code
      @turn += 1
    else
      puts 'Please choose a valid 4 digit code'
    end
  end
end

