# frozen_string_literal: true

require 'colorize'

# handles playing the actual game of mastermind if human playing
class HumanGame
  def initialize
    @peg = Pegs.new
    @key = Keys.new
    @comp_code = Array.new(4) { rand(1...6) }
  end

  def play
    @counter = 1
    player_turn while @counter < 13
  end

  def display(guess)
    puts
    guess.each { |i| print "#{@peg.format(i)} " }
  end

  def display_feedback(guess)
    h_matches = []
    c_matches = []
    guess.each_index do |i|
      if guess[i] == @comp_code[i]
        print @key.red.to_s
        h_matches << i
        c_matches << i
      end
    end

    guess.each_index do |i|
      next if h_matches.include?(i)

      @comp_code.each_index do |j|
        next if c_matches.include?(j)

        if guess[i] == @comp_code[j]
          print @key.white.to_s
          h_matches << i
          c_matches << j
        end
      end
    end
  end

  def player_turn
    puts "\n\nEnter a 4 digit code to guess the secret code"
    guess = gets.chomp.split('').map!(&:to_i)
    if guess.all?(1..6)
      display guess
      @counter += 1
      display_feedback guess
      if guess == @comp_code
        @counter = 13
        puts "\n\nCongratuations you guessed the secret code correctly!\n\n"
        repeat_game
      elsif @counter == 13
        puts "\n\nUnfortunately you didn't crack the secret code this time.\n\n"
        display @comp_code
        puts ' '
        repeat_game
      end
    else
      puts 'Please choose a valid 4 digit code'.colorize(:color => :red)
    end
  end

  def repeat_game
    puts "\nDo you want to play again? Y/N"
    replay = gets.chomp
    puts "\nThanks for playing.\n\n" if replay.downcase != 'y'
    HumanGame.new.play if replay.downcase == 'y'
  end
end