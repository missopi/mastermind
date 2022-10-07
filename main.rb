# frozen_string_literal: true

require 'colorize'

puts ' '
puts "================== MASTERMIND =================="
puts ' '

class Pegs
    def initialize 
        code_pegs = ['  1  '.colorize(:color => :black, :background => :light_red), '  2  '.colorize(:background => :yellow), 
            '  3  '.colorize(:color => :black, :background => :light_blue), '  4  '.colorize(:background => :green), 
            '  5  '.colorize(:color => :black, :background => :light_magenta), '  6  '.colorize(:background => :cyan)]
        
        key_pegs = [' ● '.colorize(:color => :white), ' ● '.colorize(:color => :red) ]

        puts "#{code_pegs[0]}" + " " + "#{code_pegs[1]}" + " " + "#{code_pegs[2]}" + " " + "#{code_pegs[3]}" + " " + "#{code_pegs[4]}" + " " + "#{code_pegs[5]}" + '    ' + "#{key_pegs[0]}" + "#{key_pegs[1]}"
        puts ' '

    end
    
    def display_code
    end

    def update_code
    end       
end

Pegs.new

class HumanPlayer
end

class ComputerPlayer
end

class Game
end


puts 'Enter a 4 digit code to guess the secret code'
choice = gets.split('').to_a 
choice.pop # removes carriage return rom array

puts "Turn number #{}" + "#{choice[0]}" + " " + "#{choice[1]}" + " " + "#{choice[2]}" + " " + "#{choice[3]}"


