# frozen_string_literal: true

require 'colorize'

# handles playing the actual game of mastermind if human playing
class HumanGame
  def initialize
    @pegs = Pegs.new
    @keys = Keys.new
  end

  def computer_gen_code
    @comp_code = [rand(1..6), rand(1..6), rand(1..6), rand(1..6)]
  end

  def move
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
    puts "#{@pegs.pegs[@convert[0]]} #{@pegs.pegs[@convert[1]]} #{@pegs.pegs[@convert[2]]} #{@pegs.pegs[@convert[3]]}"
    puts ' '
  end

  def display_keys() end

  def player_turn
    puts 'Enter a 4 digit code to guess the secret code'
    @choice = gets.chomp.split('').map!(&:to_i)
    if choice_valid? == true
      display_code
      @guess += 1
      win?
    else
      puts 'Please choose a valid 4 digit code'.colorize(:color => :red)
    end
  end

  def win?
    true if @choice == @comp_code
  end

  def convert_comp_code
    @comp_ct = @comp_code.map { |number| number - 1 }
  end

  def display_comp_code
    convert_comp_code
    puts "#{@pegs.pegs[@comp_ct[0]]} #{@pegs.pegs[@comp_ct[1]]} #{@pegs.pegs[@comp_ct[2]]} #{@pegs.pegs[@comp_ct[3]]}"
  end

  def over?
    win?
  end

  def play
    move until over?
  end
end
