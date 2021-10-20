require_relative 'game'
require 'colorize'

module Display
  def welcome
    puts "Welcome to Hangman!\n".red.underline
    puts "(1) Start Game\n(2) Load Game".bold
	end
	
	def ask_letter
		print "Enter a Letter: "
	end

	def show_answer
		puts "Answer: #{answer.join(" ")}\n\n".bold
	end

	def show_round
		puts "Round: #{round}\n\n".cyan.italic
	end
=begin 
	def show_board
		#puts "Word: #{word}"
		#puts "Available: #{available_let}"
		
		
		
		puts "\n~~~~~~~~~~~~~~~~~~~~~~\n\n".light_white
	end
=end
	def show_wrong_let
		puts "Wrong Letters: #{wrong_let.join}\n\n".light_red.italic
	end

	def show_seperator
		puts "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n".light_white
	end

	def disp_guess
		puts "Guess: #{input}".yellow.bold
	end

	def disp_correct
		puts "Correct Guess!\n\n".light_green
	end

	def disp_incorrect
		puts "Incorrect Guess\n\n".light_red
	end

	def disp_win
		puts "Congratulations! You won!".green.blink
	end

	def disp_lose
		puts "Sorry, you hung the man".red.bold
		puts "\n\nThe correct word was #{word.cyan.bold}."
	end

	def instructions
		puts "The computer will generate a random word."
		puts "8 wrong guesses and the man is hanged.\n\n"
	end

	def disp_play_again
		puts "Would you like to play again? Y/N"
	end

	def loads_screen
		puts "SAVED FILES\n".red.underline
		save_files = Dir.children("save-files")
		save_files.each_with_index do |file, idx|
			puts "#{idx + 1} - #{file.delete_suffix(".json")}\n\n"
		end
	end

	def which_load_game
		p "Load a saved game by the corresponding number: "
	end

	def ask_filename
		puts "Enter a file name to save: "
	end

	def exit_message
		abort("Thanks for playing!")
	end

	def cls
		system 'clear'
	end

	def hangman_board
		case wrong_let.length
		when 0
			puts %q(
			    ____
			    |  
			    |
			    |
			    |
			    |
			  __|__  	
			)
		when 1
			puts %q(
			    ____
			    |  |
			    |
			    |
			    |
			    |
			   _|_  	
			)
		when 2
			puts %q(
			    ____
			    |  |
			    |  O
			    |
			    |
			    |
			   _|_  	
			)
		when 3
			puts %q(
			    ____
			    |  |
			    |  O
			    |  |
			    |
			    |
			   _|_  	
			)
		when 4
			puts %q(
			    ____
			    |  |
			    |  O
			    | \|
			    |
			    |
			   _|_  	
			)
		when 5
			puts %q(
			    ____
			    |  |
			    |  O
			    | \|/
			    |
			    |
			   _|_  	
			)
		when 6
			puts %q(
			    ____
			    |  |
			    |  O
			    | \|/
			    |  |
			    |
			   _|_  	
			)
		when 7
			puts %q(
			    ____
			    |  |
			    |  O
			    | \|/
			    |  |
			    | /
			   _|_ 	
			)
		when 8
			puts %q(
			    ____
			    |  |
			    |  O
			    | \|/
			    |  |
			    | / \
			   _|_	
			)
		end	 	  	 	  
	end

end