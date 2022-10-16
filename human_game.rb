# frozen_string_literal: true

require 'colorize'
require_relative 'comp_code'

# handles playing the actual game of mastermind if human playing
class HumanGame
  def initialize
    @pegs = Pegs.new
    @keys = Keys.new
    @computer = CompCode.new
  end

  def move
    @computer.display_pegs
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
    print "\n#{@pegs.pegs[@convert[0]]} #{@pegs.pegs[@convert[1]]} #{@pegs.pegs[@convert[2]]} #{@pegs.pegs[@convert[3]]} "
    print '    '
  end

  def display_result
    human_matches = []
    computer_matches = []
    @choice.each_index do |index|
      if @choice[index] == @computer.random_code[index]
        print @keys.keys[1].to_s
        human_matches << index
        computer_matches << index
      end
    end

    @choice.each_index do |index|
      next if human_matches.include?(index)

      @computer.random_code.each_index do |comp_index|
        next if computer_matches.include?(comp_index)

        if @choice[index] == @computer.random_code[comp_index]
          print @keys.keys[0].to_s
          human_matches << index
          computer_matches << comp_index
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
    if @choice == @computer.random_code
      @guess = 13
      puts "\n\nCongratuations you guessed the secret code correctly!\n\n"
    elsif @choice != @computer.random_code && @guess == 13
      puts "\n\nUnfortunately you didn't crack the secret code this time.\n\n"
      @computer.display_pegs
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
