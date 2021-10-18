require './game.rb'

module Display
  def welcome
    puts "Welcome to Hangman!\n\n"
    puts "(1) Start Game\n(2) Load Game"
	end
	
	def ask_letter
		print "Enter a Letter: "
	end

	def show_round
		puts "Round: #{round}\n\n"
	end

	def show_board
		#puts "Word: #{word}"
		#puts "Available: #{available_let}"
		puts "Answer: #{answer.join}\n\n"
		puts "Wrong Letters: #{wrong_let.join}"
		puts "\n~~~~~~~~~~~~~~~~~~~~~~\n\n"
		
	end

	def disp_guess
		puts "Guess: #{input}"
	end

	def disp_correct
		puts "Correct Guess!\n\n"
	end

	def disp_incorrect
		puts "Incorrect Guess\n\n"
	end

	def disp_win
		puts "Congratulations! You won!"
	end

	def disp_lose
		puts "Sorry, you hung the man"
	end

	def instructions
		puts "The computer will generate a random word."
		puts "Guess 6 letters wrong and the man will be hung.\n\n"
	end

	def disp_play_again
		puts "Would you like to play again? Y/N"
	end

end