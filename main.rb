# frozen_string_literal: true

require 'colorize'

puts ' '
puts "================== MASTERMIND =================="
puts ' '

peg = ['  1  '.colorize(:color => :black, :background => :light_red), '  2  '.colorize(:background => :yellow), 
    '  3  '.colorize(:color => :black, :background => :light_blue), '  4  '.colorize(:background => :green), 
    '  5  '.colorize(:color => :black, :background => :light_magenta), '  6  '.colorize(:background => :cyan)]

puts "#{peg[0]}" + " " + "#{peg[1]}" + " " + "#{peg[2]}" + " " + "#{peg[3]}" + " " + "#{peg[4]}" + " " + "#{peg[5]}"



puts 'Enter a 4 digit code to guess the secret code'
choice = gets.split('').to_a 
choice.pop # removes carriage return rom array

puts "Turn number #{}" + "#{choice[0]}" + " " + "#{choice[1]}" + " " + "#{choice[2]}" + " " + "#{choice[3]}"


