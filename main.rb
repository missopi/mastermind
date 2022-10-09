# frozen_string_literal: true

require 'colorize'
require_relative 'human_game'
require_relative 'comp_game'

# main game class that runs everything
class Game
  def initialize
    puts MastermindRules.new.display_rules
  end

  def choose_game_type
    puts 'Choose 1 to play as the codebreaker and 2 to play as the codemaker'
    @option = gets.to_i
  end

  def initialize_game_type
    if @option == 1
        HumanGame.new
    elsif @option == 2
        CompGame.new
    else
      puts 'Please choose a valid option'
    end
  end
end