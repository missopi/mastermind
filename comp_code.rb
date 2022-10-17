# frozen_string_literal: true

require 'colorize'

# class to get and display computer generated code
class CompCode
  attr_reader :random_number

  def initialize
    @random_number = Array.new(4) { rand(1...6) }
    @peg = Pegs.new
  end

  def random_comp_code
    puts "#{random_number[0]} #{random_number[1]} #{random_number[2]} #{random_number[3]}"
  end

  def convert_code_to_index
    @index = random_number.map { |number| number - 1 }
  end

  def display_random_code
    convert_code_to_index
    puts "#{@peg.colour[@index[0]]} #{@peg.colour[@index[1]]} #{@peg.colour[@index[2]]} #{@peg.colour[@index[3]]}"
  end
end

