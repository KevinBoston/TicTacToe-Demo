class TicTacToe

	WIN_COMB = [
	[0,1,2],
	[3,4,5],
	[6,7,8],
	[0,3,6],
	[1,4,7],
	[2,5,8],
	[0,4,8],
	[2,4,6]
	]
	#Setup
	def initialize(board=nil)
		@board = board || board = Array.new(9, " ")
	end

	def display_board
		puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
		puts "-----------"
		puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
		puts "-----------"
		puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  	end

	#Mechanics
	def input_to_index(u_input)
		u_input.to_i - 1
	end
	
	def move(index, token="X")
		@board[index] = token
	end
	
	def position_taken?(index)
		@board[index] != " "
	end
	
	def valid_move?(index)
		index.between?(0,8) && !position_taken?(index)
	end

	def turn_count
		@board.count{|token|token != " "}
	end

	def current_player
		turn_count.even? ? "X" : "O"
	end

	#Turn loop
	def turn
		puts "Please enter 1-9:"
		user_input = gets.strip
		index = input_to_index(user_input)
		valid_move?(index) ? move(index, current_player)
		display_board
	end

	#Win Conditions
	def won?
		WIN_COMB.any? do |combo|
			if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
				return combo
			end
		end
	end

	def full?
		@board.all? {|space| space != " "}
	end

	def draw?
		full? && !won?
	end

	def over?
		won? || draw?
	end

	def winner
		if combo = won?
			@board[combo[0]]
		end
	end

	#Play Loop
	def play
		turn until over?

		if winner
			puts "Congrats to token #{winner}!"
		else
			puts "Tie game!"
		end
	end
end