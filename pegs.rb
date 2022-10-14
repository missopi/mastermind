# frozen_string_literal: true

require 'colorize'

# handles the coloured pegs that show the code in the terminal
class Pegs
  attr_reader :pegs

  def initialize
    @pegs = ['  1  '.colorize(:color => :black, :background => :light_red),
             '  2  '.colorize(:background => :yellow),
             '  3  '.colorize(:color => :black, :background => :light_blue),
             '  4  '.colorize(:background => :green),
             '  5  '.colorize(:color => :black, :background => :light_magenta),
             '  6  '.colorize(:background => :cyan)]
  end

  def initial_pegs
    puts "#{pegs[0]} #{pegs[1]} #{pegs[2]} #{pegs[3]} #{pegs[4]} #{pegs[5]}\n"
  end
end