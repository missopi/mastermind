# frozen_string_literal: true
require 'colorize'
require_relative 'comp_code'
# handles playing the actual game of mastermind if human playing
class HumanGame
  def initialize
    @peg = Pegs.new
    @key = Keys.new
    @comp_code = CompCode.new
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
    print "\n#{@peg.colour[@convert[0]]} #{@peg.colour[@convert[1]]} #{@peg.colour[@convert[2]]} #{@peg.colour[@convert[3]]} "
    print '    '
  end

  def display_result
    h_matches = []
    c_matches = []
    @choice.each_index do |i|
      if @choice[i] == @comp_code.random_number[i]
        print @key.red.to_s
        h_matches << i
        c_matches << i
      end
    end

    @choice.each_index do |i|
      next if h_matches.include?(i)

      @comp_code.random_number.each_index do |j|
        next if c_matches.include?(j)

        if @choice[i] == @comp_code.random_number[j]
          print @key.white.to_s
          h_matches << i
          c_matches << j
        end
      end
    end
  end

  def player_turn
    puts "\n\nEnter a 4 digit code to guess the secret code"
    @choice = gets.chomp.split('').map!(&:to_i)
    if choice_valid? == true
      display_code
      @guess += 1
      display_result
      win
    else
      puts 'Please choose a valid 4 digit code'.colorize(:color => :red)
    end
  end

  def win
    if @choice == @comp_code.random_number
      @guess = 13
      puts "\n\nCongratuations you guessed the secret code correctly!\n\n"
    elsif @choice != @comp_code.random_number && @guess == 13
      puts "\n\nUnfortunately you didn't crack the secret code this time.\n\n"
      @comp_code.display_random_code
      puts ' '
    end
  end

  def over?
    win
  end

  def play
    move until over?
  end

end