# frozen_string_literal: true

require 'colorize'
require_relative 'comp_code'

# handles playing the actual game of mastermind if human playing
class HumanGame
  def initialize
    @pegs = Pegs.new
    @keys = Keys.new
    @comp_code = CompCode.new
  end

  def move
    @comp_code.display_code
    over?
    @guess = 1
    player_turn while @guess < 13
  end

  def choice_valid?
    true if @choice.all?(1..6)
  end

  def convert_choice_to_pegs
    @convert = @choice.map { |number| number - 1 }
  end

  def display_code
    convert_choice_to_pegs
    puts ' '
    print "#{@pegs.pegs[@convert[0]]} #{@pegs.pegs[@convert[1]]} #{@pegs.pegs[@convert[2]]} #{@pegs.pegs[@convert[3]]} "
    print '    '
  end

  def display_red_keys
    @comp_code.comp_code.each_with_index do |code, index1|
      @choice.each_with_index do |num, index2|
        print @keys.keys[1].to_s if num == code && index2 == index1
      end
    end
    puts ' '
    puts ' '
  end

  def player_turn
    puts 'Enter a 4 digit code to guess the secret code'
    @choice = gets.chomp.split('').map!(&:to_i)
    if choice_valid? == true
      display_code
      @guess += 1
      win?
      display_red_keys
    else
      puts 'Please choose a valid 4 digit code'.colorize(:color => :red)
    end
  end

  def win?
    true if @choice == @comp_code
  end

  def over?
    win?
  end

  def play
    move until over?
  end
end
