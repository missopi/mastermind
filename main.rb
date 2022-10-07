# frozen_string_literal: true

require 'colorize'

puts ' '
puts "================== MASTERMIND =================="
puts ' '

class HumanPlayer
end

class ComputerPlayer
end

class Pegs
    attr_reader :code_pegs, :key_pegs

    def initialize 
        @code_pegs = ['  1  '.colorize(:color => :black, :background => :light_red), '  2  '.colorize(:background => :yellow), 
            '  3  '.colorize(:color => :black, :background => :light_blue), '  4  '.colorize(:background => :green), 
            '  5  '.colorize(:color => :black, :background => :light_magenta), '  6  '.colorize(:background => :cyan)]
        @key_pegs = [' ● '.colorize(:color => :white), ' ● '.colorize(:color => :red) ]

        puts "#{code_pegs[0]}" + " " + "#{code_pegs[1]}" + " " + "#{code_pegs[2]}" + " " + "#{code_pegs[3]}" + " " + "#{code_pegs[4]}" + " " + "#{code_pegs[5]}" 
        puts ' '
        puts "#{key_pegs[0]}" + "#{key_pegs[1]}"
        puts ' '
    end
    
    def update_pegs
    end       
end

class Game
    def initialize
        @pegs = Pegs.new
    end

    def convert_choice_to_pegs
        puts 'Enter a 4 digit code to guess the secret code'
        choice = gets.split('').to_a 
        choice.pop # removes carriage return rom array
        choice
    end

    def display_pegs
        convert_choice_to_pegs
        puts "#{@code_pegs[choice[0]]}" + " " + "#{@code_pegs[choice[1]]}" + " " +
         "#{@code_pegs[choice[2]]}" + " " + "#{@code_pegs[choice[3]]}"
    end
end

mastermind = Game.new
mastermind.display_pegs








