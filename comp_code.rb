# frozen_string_literal: true

require 'colorize'

# class to get and display computer generated code
class CompCode
  attr_reader :comp_code

  def initialize
    @comp_code = Array.new(4) { rand(1...6) }
    @pegs = Pegs.new
  end

  def display_code
    puts "#{comp_code[0]} #{comp_code[1]} #{comp_code[2]} #{comp_code[3]}"
  end

  def convert_comp_code
    @comp_ct = comp_code.map { |number| number - 1 }
  end

  def display_comp_code_pegs
    convert_comp_code
    puts "#{@pegs.pegs[@comp_ct[0]]} #{@pegs.pegs[@comp_ct[1]]} #{@pegs.pegs[@comp_ct[2]]} #{@pegs.pegs[@comp_ct[3]]}"
  end
end
