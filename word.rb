class Word
  def initialize;	end
	
	def rand_word
		@file = File.new('5desk.txt', chomp: true)
		@lines = @file.readlines.map { |l| l.chomp }
		@lines = @lines.select {|l| l.length > 4 && l.length < 13 }
		@word = @lines[rand(@lines.length - 1)].upcase
	end

end
