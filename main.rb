# frozen_string_literal: true

require 'colorize'

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

# class to display the title and rules of the game at the beginning
class MastermindRules
  def initialize
    @pegs = Pegs.new
    @keys = Keys.new
  end

  def rules
    puts ' '
    puts '          ==============================   MASTERMIND   ==============================          '
    puts ' '
    puts 'Mastermind is a code breaking game for two players. One player becomes the codemaker, the other '
    puts 'the codebreaker. The codebreaker tries to guess the pattern, in both order and color, within'
    puts 'twelve turns.'
    puts ' '
  end

  def peg_rules
    puts 'The codemaker chooses a pattern of four code pegs from six available colours. Duplicates are allowed.'
    puts ' '
    @pegs.initial_pegs
  end

  def key_rules
    puts 'Once a guess is made, the feedback is given in the form of zero to four white or red keys.'
    puts 'White keys indicate a correct color code peg placed in the wrong position. Red keys are used when'
    puts 'the guess is correct in both color and position.'
    @keys.initial_keys
  end

  def rules_two
    puts 'Once feedback is provided, another guess is made; guesses and feedback continue to alternate until'
    puts 'either the codebreaker guesses correctly, or all rows on the decoding board are full.'
    puts ' '
  end

  def display_rules
    rules
    peg_rules
    key_rules
    rules_two
    puts '==== end of rules ===='
  end
end

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
