class TicTacToe

  def initialize
    @grid = [" "] * 9         # Playable grid
    @open_moves = Array(1..9) # Unoccupied spaces
    display_welcome
  end

  def display_grid
    puts "#{@grid[0]} | #{@grid[1]} | #{@grid[2]}"
    puts "----------"
    puts "#{@grid[3]} | #{@grid[4]} | #{@grid[5]}"
    puts "----------"
    puts "#{@grid[6]} | #{@grid[7]} | #{@grid[8]}"
  end

  def winning_positions
    [
      [0,1,2], [3,4,5], [6,7,8], # rows
      [0,3,6], [1,4,7], [2,5,8], # columns
      [0,4,8], [2,4,6]           # diagonals
    ]
  end

  def display_welcome
    puts "Welcome to Tic-Tac-Toe by Brian Choy"
    puts "This is the grid:"
    puts " "
    puts " 1 | 2 | 3 "
    puts "------------"
    puts " 4 | 5 | 6 "
    puts "------------"
    puts " 7 | 8 | 9 "
    puts " "

    player_1
  end

  def player_1
    puts "Player 1, please pick a square: "
    choice = gets.to_i

    until @open_moves.include? choice
      puts "Please pick a valid square:"
      choice = gets.to_i
    end
    
    @grid[choice-1] = "X"
    @open_moves.delete(choice)
    display_grid
    puts " "
    winner_check
    player_cpu
  end

  def player_cpu
    puts "Computer moves: "
    computer_move = @open_moves.sample  # Select random square from unoccupied spaces
    @open_moves.delete(computer_move)
    @grid[computer_move-1] = "O"
    # @grid[best_move] = "O"            # [INCOMPLETE] Gets best move (see below)
    display_grid
    puts " "
    winner_check
    player_1
  end

  def winner_check
    winner_x = ["X","X","X"]             # Player 1 victory
    winner_o = ["O","O","O"]             # CPU victory
    winning_positions.each do |x|
      if @grid.values_at(*x) == winner_x
        puts "Player 1 wins!"
        exit 1
      elsif @grid.values_at(*x) == winner_o
        puts "Player 2 wins!"
        exit 1
      elsif @open_moves.empty?           # No more moves left
        puts "Tie game!"
        exit 1
      end
    end
  end

  # [INCOMPLETE] Computer AI
  # The idea is to scan winning_positions for 2 X's or O's in a row (O not implemented)
  # AI will pick the missing square to either win or block opponent from winning
  # Completely ignores occupied space. Needs is_empty? check

  # def best_move
  #   one_away_x_1 = ["X", "X", " "]
  #   one_away_x_2 = ["X", " ", "X"]
  #   one_away_x_3 = [" ", "X", "X"]
  #   winning_positions.each do |x|
  #     if @grid.values_at(*x) == one_away_x_1 || @grid.values_at(*x) == one_away_x_2 || @grid.values_at(*x) == one_away_x_3
  #       return x.index(nil)           # Implicit conversion error
  #     else
  #       return @open_moves.sample
  #     end
  #   end
  # end

  tictactoe = TicTacToe.new
end
