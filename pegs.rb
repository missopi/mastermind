# frozen_string_literal: true

require 'colorize'

# handles the coloured pegs that show the code in the terminal
class Pegs
  attr_reader :colour

  def initialize
    @colour = ['  1  '.colorize(:color => :black, :background => :light_red),
             '  2  '.colorize(:background => :yellow),
             '  3  '.colorize(:color => :black, :background => :light_blue),
             '  4  '.colorize(:background => :green),
             '  5  '.colorize(:color => :black, :background => :light_magenta),
             '  6  '.colorize(:background => :cyan)]
  end

  def initial_pegs
    puts "#{colour[0]} #{colour[1]} #{colour[2]} #{colour[3]} #{colour[4]} #{colour[5]}\n"
  end
end