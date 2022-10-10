# frozen_string_literal: true

require 'colorize'

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
