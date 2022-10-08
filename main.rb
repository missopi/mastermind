# frozen_string_literal: true

require 'colorize'

puts ' '
puts '================== MASTERMIND =================='
puts ' '

class HumanPlayer
end

class ComputerPlayer
end

# handles the coloured keys that show when guesses are correct
class KeyPegs
  attr_reader :key_pegs

  def initialize
    @key_pegs = [' ● '.colorize(color: white), ' ● '.colorize(color: red)]
  end

  def initial_keys(key_pegs)
    puts ' '
    puts "#{key_pegs[1]}#{key_pegs[1]}#{key_pegs[0]}#{key_pegs[0]}"
    puts ' '
  end

  def display_keys(key_pegs) end
end

# handles the coloured pegs that show the code in the terminal
class CodePegs
  attr_reader :code_pegs

  def initialize
    @code_pegs = ['  1  '.colorize(color: black, background: light_red), '  2  '.colorize(background: yellow),
                  '  3  '.colorize(color: black, background: light_blue), '  4  '.colorize(background: green),
                  '  5  '.colorize(color: black, background: light_magenta), '  6  '.colorize(background: cyan)]
  end

  def initial_pegs(code_pegs)
    puts "#{code_pegs[0]} #{code_pegs[1]} #{code_pegs[2]} #{code_pegs[3]} #{code_pegs[4]} #{code_pegs[5]}"
    puts ' '
  end
end

# class to actually play the game
class Game
  def initialize
    @pegs = Pegs.new
  end

  def convert_choice_to_pegs
    puts 'Enter a 4 digit code to guess the secret code'
    choice = gets.split('').to_a
    choice.pop # removes carriage return rom array
    choice
  end

  def display_pegs
    convert_choice_to_pegs
    puts "#{@code_pegs[choice[0]]}" + ' ' + "#{@code_pegs[choice[1]]}" + ' ' +
    "#{@code_pegs[choice[2]]}" + ' ' + "#{@code_pegs[choice[3]]}"
  end
end