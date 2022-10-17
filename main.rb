# frozen_string_literal: true

require 'colorize'
require_relative 'rules'
require_relative 'human_game'
require_relative 'comp_game'

# main game class that runs everything
class Game
  def initialize
    puts MastermindRules.new.display_rules
  end

  def choose_game_type
    puts 'Choose 1 to play as the codebreaker and 2 to play as the codemaker'
    option = gets.to_i
    case option
    when 1
      HumanGame.new.play # human player guesses the code
    when 2
      CompGame.new.play # computer guesses the code
    else
      puts 'Please choose a valid option'.colorize(:color => :red)
    end
  end
end

Game.new.choose_game_type
