# frozen_string_literal: true

require 'colorize'

# handles playing the actual game of mastermind if human playing
class HumanGame
  def initialize
    @peg = Pegs.new
    @key = Keys.new
    @random_comp_code = Array.new(4) { rand(1...6) }
  end

  def play
    @counter = 1
    player_turn while @counter < 13
  end

  # displays numbers as coloured pegs
  def display(guess)
    puts
    guess.each { |i| print "#{@peg.format(i)} " }
  end

  def display_feedback(guess)
    human_matches = []
    computer_matches = []
    guess.each_index do |i|
      if guess[i] == @random_comp_code[i]
        print @key.red.to_s
        human_matches << i
        computer_matches << i
      end
    end

    guess.each_index do |i|
      next if human_matches.include?(i)

      @random_comp_code.each_index do |j|
        next if computer_matches.include?(j)

        if guess[i] == @random_comp_code[j]
          print @key.white.to_s
          human_matches << i
          computer_matches << j
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
      if guess == @random_comp_code
        @counter = 13
        puts "\n\nCongratuations you guessed the secret code correctly!\n\n"
        repeat_game
      elsif @counter == 13
        puts "\n\nUnfortunately you didn't crack the secret code this time.\n\n"
        display @random_comp_code
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