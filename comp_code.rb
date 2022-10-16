# frozen_string_literal: true

require 'colorize'

# class to get and display computer generated code
class CompCode
  attr_reader :random_code

  def initialize
    @random_code = Array.new(4) { rand(1...6) }
    @pegs = Pegs.new
  end

  def display_code
    puts "#{random_code[0]} #{random_code[1]} #{random_code[2]} #{random_code[3]}"
  end

  def convert_code
    @index = random_code.map { |number| number - 1 }
  end

  def display_pegs
    convert_code
    puts "#{@pegs.pegs[@index[0]]} #{@pegs.pegs[@index[1]]} #{@pegs.pegs[@index[2]]} #{@pegs.pegs[@index[3]]}"
  end
end
