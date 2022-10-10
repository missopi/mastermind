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
    @option = gets.to_i
    puts ' '
  end

  def initialize_game_type
    choose_game_type
    if @option == 1
        human = HumanGame.new
        human.move
    elsif @option == 2
        CompGame.new
    else
      puts 'Please choose a valid option'
    end
  end
end

gameone = Game.new
gameone.initialize_game_type
