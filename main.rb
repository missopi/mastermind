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

  def convert_choice_to_pegs
    puts 'Enter a 4 digit code to guess the secret code'
    @choice = gets.split('').to_a
    @choice.pop # removes carriage return rom array
    @choice.map! do |number|
      number.to_i - 1
    end
  end

  def display_code
    convert_choice_to_pegs
    puts ' '
    puts "#{@pegs.pegs[@choice[0]]} #{@pegs.pegs[@choice[1]]} #{@pegs.pegs[@choice[2]]} #{@pegs.pegs[@choice[3]]}"
    puts ' '
  end
end

game = HumanGame.new
game.display_code

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
