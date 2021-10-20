#save-load branch

require_relative 'word'
require_relative 'display'
require 'json'

class Game
  include Display

  attr_reader :available_let, :answer, :wrong_let, :word, :round, :end, :split_let, :win, :input

	def initialize
		menu
	end

	def menu
		mode = nil
		until mode == '1' || mode == '2'
			cls
			welcome
			mode = gets.chomp
		end
		cls
		if mode == '2'
			load_game
			play
		else
			create
			play
		end
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

	def load(w, a_let, r, end1, s_let, ans, w_let, win)
		@word = w
		@available_let = a_let
		@round = r
		@end = end1
		@split_let = s_let
		@answer = ans
		@wrong_let = w_let
		@win = win
		hangman_board
	end

  	def play
		until @end == true
			check_word
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
		@round += 1
	end
	
	def get_let_input
		@input = ''
		until @available_let.include?(@input) || @input == "SAVE"
			show_round
			hangman_board
			show_seperator
			show_answer
			show_wrong_let
			ask_letter
      		@input = gets.chomp.upcase
		end
		
		cls
		if @input == "SAVE"
			save_game
		end
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
			exit_message
		end
	end
	
	def get_save_filename
		ask_filename
		@filename = gets.chomp
	end

	def save_game
		get_save_filename
		Dir.mkdir('save-files') unless Dir.exist?('save-files')
		File.open("save-files/#{@filename}.json", "w") do |file|
			file.puts(to_json)
		end
		exit_message
	end

	def to_json
		JSON.dump({
					"word": @word,
					"available_let": @available_let,
					"round": @round,
					"end": @end,
					"split_let": @split_let,			
					"answer": @answer,
					"wrong_let": @wrong_let,
					"win": @win
				  })
	end

	def from_json(save_game)
		data = JSON.parse(File.read(save_game))
		load(
			data["word"],
			data["available_let"],
			data["round"],
			data["end"],
			data["split_let"],
			data["answer"],
			data["wrong_let"],
			data["win"]
		)
	end

	def load_game
		loads_screen
		save_files = Dir.children("save-files")
		f_select = ''
		f_num = 0
		until f_num <= save_files.size && f_num != 0
			which_load_game
			f_num = gets.chomp.to_i
		end
		f_select = save_files[f_num - 1]
		
		File.open("save-files/#{f_select}", 'r') do |file|
			from_json(file)
		end
		cls
	end
end
