class Board
  attr_accessor :arr

  def initialize arr=false
    @arr = arr ? arr : Array.new(7) { Array.new(6) }
  end

  def add column, player_piece
    #validate entry
    column = column - 1
    if column < 0 or column > 6 or full? @arr[column]
      return false
    end

    top = find_top @arr[column]
    @arr[column][top] = player_piece

    true
  end

  def display
    arr = @arr.clone
    arr.each_with_index do |column,index|
      arr[index] = column.reverse
    end
    puts " CONNECT FOUR "

    (0..arr[0].size-1).each do |row|
      (0..arr.size-1).each do |column|
        print "|#{arr[column][row].nil? ? " " : arr[column][row]}|"
      end
      puts
    end

    (1..arr.size).each_with_index do |column,index|
      print " #{index+1} "
    end
    true
  end

  def four_in_a_row? arr
    if arr[0] == arr[1] and arr[1] == arr[2] and arr[2] == arr[3]
      return arr[0]
    else
      return false
    end
  end


  def winner? player1, player2
    player1 = player1.piece
    player2 = player2.piece
    winner = false
    arr = @arr.clone


    # horizontal wins
    (0..3).each do |pass|
      (0..arr[0].size-1).each do |row|
        test_arr = []
        (0..3).each do |column|
          test_arr.push arr[column+pass][row]
        end

        winner = four_in_a_row? test_arr
        if winner == player1
          return "Player 1"
        elsif winner == player2
          return "Player 2"
        end
      end
    end

    # vertical wins
    (0..2).each do |pass|
      (0..arr.size-1).each do |column|
        test_arr = []
        (0..3).each do |row|
          test_arr.push arr[column][row+pass]
        end
        winner = four_in_a_row? test_arr
        if winner == player1
          return "Player 1"
        elsif winner == player2
          return "Player 2"
        end
      end
    end

    #pos diagonal wins
    (0..3).each do |column_displacement|
      (0..2).each do |row_displacement|
        test_arr = []
        (0..3).each do |starting|
          test_arr[starting] = \
            arr[starting+column_displacement][starting+row_displacement]
        end
        winner = four_in_a_row? test_arr
        if winner == player1
          return "Player 1"
        elsif winner == player2
          return "Player 2"
        end
      end
    end

    #neg diagonal wins
    (0..3).each do |column_displacement|
      (3..5).each do |row_displacement|
        test_arr = []
        (0..3).each do |starting|
          test_arr[starting] = \
            arr[starting+column_displacement][row_displacement-starting]
        end
        winner = four_in_a_row? test_arr
        if winner == player1
          return "Player 1"
        elsif winner == player2
          return "Player 2"
        end
      end
    end


    return false
  end

  def all_full?
    @arr.each do |column|
      return false if !full? column
    end
    true
  end

  private

  def find_top arr
    arr.each_with_index do |value,index|
      return index if value.nil?
    end
  end

  def full? arr
    return false if arr.last.nil?
    true
  end
end
