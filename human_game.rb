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
    player_turn
  end

  def player_choice
    puts 'Enter a 4 digit code to guess the secret code'
    @choice = gets.split('').to_a
    @choice.pop # removes carriage return rom array
    @choice.map!(&:to_i)
    p @choice
  end

  def choice_valid?
    true if @choice.map.all?(1..6)
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

  def player_turn
    player_choice
    if choice_valid? == true
      display_code
      win?
      lose?
    else
      puts 'Please choose a valid 4 digit code'
    end
  end

  def win?
    true if player_choice == @comp_code
  end

  def convert_comp_code
    @comp_ct = @comp_code.map { |number| number - 1 }
  end

  def display_comp_code
    convert_comp_code
    puts "#{@pegs.pegs[@comp_ct[0]]} #{@pegs.pegs[@comp_ct[1]]} #{@pegs.pegs[@comp_ct[2]]} #{@pegs.pegs[@comp_ct[3]]}"
  end

  def game_end
    if win? == true
      @turn = 13
      puts 'Congratulations, you guessed the code correctly'
      puts ' '
    elsif lose == true
      puts "Unfortunately you didn't guess the code correctly"
      puts ' '
    end
    display_comp_code
  end

  def lose?
    true if player_choice != @comp_code && @turn == 12
  end

  def over?
    win? || lose?
  end

  def play
    move until over?
  end
end
