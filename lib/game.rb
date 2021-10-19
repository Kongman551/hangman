require_relative 'word'
require_relative 'display'
require 'json'

class Game
  include Display

  attr_reader :available_let, :answer, :wrong_let, :word, :round, :input

	def initialize
		menu
	end

	def menu
		mode = nil
		until mode == '1'
			cls
			welcome
			mode = gets.chomp
		end
		cls
		create
		play
	end

	def create
		@word = Word.new.rand_word
		@available_let = %w[A B C D E F G H I J K L M N O P Q R S T U V W X Y Z]
		@round = 1
		@end = false
		@split_let = @word.split('')
		@answer = Array.new(@split_let.length, '_')
		@wrong_let = []
		@win = nil
		instructions
	end

  	def play
		until @end == true
      		check_word
			show_board
			check_win	
		end
		if !@win 
			disp_lose
		else 
			disp_win
		end
		play_again
	end

	def check_win
		if @wrong_let.length == 8
			@end = true
			@win = false
		elsif !@answer.include?("_")
			@end = true
			@win = true
		end
	end

  	def check_word
		@input = ''
		show_round
    	get_let_input
		@available_let.delete(@input)
		disp_guess
		if @split_let.include?(@input)
			disp_correct
			@split_let.each_with_index do |let, idx|
				@answer[idx] = @input if let == @input
			end
		else
			@wrong_let.push(@input)
			disp_incorrect
		end
		hangman_board
		@round += 1
	end
	
	def get_let_input
		until @available_let.include?(@input)
			 if @round == 1
				hangman_board
				show_answer
			 end
      		ask_letter
      		@input = gets.chomp.upcase
		end
		cls
	end

	def play_again
		input = ''
		until ["Y", "N"].include?(input)
			disp_play_again
			input = gets.chomp.upcase
		end
		if input == "Y"
			cls
			menu
		else
			abort("Thanks for playing!")
		end
	end
	
	def cls
		system 'clear'
	end
end
