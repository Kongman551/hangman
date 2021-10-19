require_relative 'game'
require 'colorize'

module Display
  def welcome
    puts "Welcome to Hangman!\n\n".red.underline
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

	def show_board
		#puts "Word: #{word}"
		#puts "Available: #{available_let}"
		
		show_answer
		puts "Wrong Letters: #{wrong_let.join}".italic
		puts "\n~~~~~~~~~~~~~~~~~~~~~~\n\n".light_white
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