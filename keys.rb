# frozen_string_literal: true

require 'colorize'

# handles the coloured keys that show when guesses are correct
class Keys
  attr_reader :keys

  def initialize
    @keys = [' ● '.colorize(:color => :white), ' ● '.colorize(:color => :red)]
  end

  def initial_keys
    puts "\n#{keys[1]}#{keys[1]}#{keys[0]}#{keys[0]}\n"
  end
end