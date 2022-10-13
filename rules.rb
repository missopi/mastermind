# frozen_string_literal: true

require 'colorize'
require_relative 'pegs'
require_relative 'keys'

# class to display the title and rules of the game at the beginning
class MastermindRules
  def initialize
    @pegs = Pegs.new
    @keys = Keys.new
  end

  def rules
    puts "\n          ==============================   MASTERMIND   ==============================          "
    puts "\nMastermind is a code breaking game for two players. One player becomes the codemaker, the other "
    puts 'the codebreaker. The codebreaker tries to guess the pattern, in both order and colour, within'
    puts "twelve turns.\n\n"
  end

  def peg_rules
    puts "The codemaker chooses a pattern of four code numbers from six available colours. Duplicates are allowed.\n\n"
    @pegs.initial_pegs
  end

  def key_rules
    puts "\nOnce a guess is made, the feedback is given in the form of zero to four white or red keys."
    puts 'White keys indicate a correct colour code number chosen in the wrong position. Red keys are used when'
    puts 'the guess is correct in both colour and position.'
    @keys.initial_keys
  end

  def rules_two
    puts "\nOnce feedback is provided, another guess is made; guesses and feedback continue to alternate until"
    puts "either the codebreaker finds the correct code, or runs out of guesses.\n\n"
  end

  def display_rules
    rules
    peg_rules
    key_rules
    rules_two
    puts '          =============================================================================          '
  end
end