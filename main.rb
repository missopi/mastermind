# frozen_string_literal: true

require 'colorize'
require_relative 'rules'

# handles playing the actual game of mastermind if human playing
class HumanGame
  def initialize
    @pegs = Pegs.new
    @keys = Keys.new
    puts MastermindRules.new.display_rules
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

game = HumanGame.new
game.player_turn

# handles if the computer is guessing and the human makes the code
class CompGame
  def initialize
    @pegs = Pegs.new
  end

  def comp_choice
    # comp choice is currently random - will need to change so has a strategy later
    puts '===== comp guess ======'
    puts ' '
    @comp = [rand(1..6), rand(1..6), rand(1..6), rand(1..6)]
    @comp_i = @comp.map { |number| number - 1 }
  end

  def display_comp_choice
    comp_choice
    puts ' '
    puts "#{@pegs.pegs[@comp_i[0]]} #{@pegs.pegs[@comp_i[1]]} #{@pegs.pegs[@comp_i[2]]} #{@pegs.pegs[@comp_i[3]]}"
    puts ' '
    puts ' '
  end
end

comp = CompGame.new
comp.display_comp_choice
