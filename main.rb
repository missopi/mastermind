# frozen_string_literal: true

require 'colorize'

puts ' '
puts '================== MASTERMIND =================='
puts ' '

class HumanPlayer
end

class ComputerPlayer
end

# handles the coloured pegs that show the code in the terminal
class Pegs
  attr_reader :pegs

  def initialize
    @pegs = ['  1  '.colorize(:color => :black, :background => :light_red), '  2  '.colorize(:background => :yellow),
             '  3  '.colorize(:color => :black, :background => :light_blue), '  4  '.colorize(:background => :green),
             '  5  '.colorize(:color => :black, :background => :light_magenta), '  6  '.colorize(:background => :cyan)]
  end

  def initial_pegs
    puts "#{pegs[0]} #{pegs[1]} #{pegs[2]} #{pegs[3]} #{pegs[4]} #{pegs[5]}"
    puts ' '
  end
end

codes = Pegs.new
codes.initial_pegs

# handles the coloured keys that show when guesses are correct
class Keys
  attr_reader :keys

  def initialize
    @keys = [' ● '.colorize(:color => :white), ' ● '.colorize(:color => :red)]
  end

  def initial_keys
    puts ' '
    puts "#{keys[1]}#{keys[1]}#{keys[0]}#{keys[0]}"
    puts ' '
  end

  def display_keys(keys) end
end

keys = Keys.new
keys.initial_keys

# handles playing the actual game of mastermind
class Game
  def initialize
    @pegs = Pegs.new
  end

  def convert_choice_to_pegs
    puts 'Enter a 4 digit code to guess the secret code'
    @choice = gets.split('').to_a
    @choice.pop # removes carriage return rom array
    @choice.map!(&:to_i)
    @choice.map! { |number| number - 1 }
  end

  def display_code
    convert_choice_to_pegs
    puts ' '
    puts "#{@pegs.pegs[@choice[0]]} #{@pegs.pegs[@choice[1]]} #{@pegs.pegs[@choice[2]]} #{@pegs.pegs[@choice[3]]}"
    puts ' '
  end
end

game = Game.new
game.display_code
