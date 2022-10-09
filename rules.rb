# frozen_string_literal: true

require 'colorize'
require_relative 'pegs.rb'
require_relative 'keys.rb'

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
    puts 'the codebreaker. The codebreaker tries to guess the pattern, in both order and colour, within'
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
    puts 'White keys indicate a correct colour code peg chosen in the wrong position. Red keys are used when'
    puts 'the guess is correct in both colour and position.'
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