# frozen_string_literal: true

require 'colorize'

# handles the coloured keys that show when guesses are correct
class Keys
  attr_reader :red, :white

  def initialize
    @white = ' ● '.colorize(:color => :white)
    @red = ' ● '.colorize(:color => :red)
  end

  def initial_keys
    puts "\n#{red}#{red}#{white}#{white}\n"
  end
end
