require_relative "board"
require_relative "player"

def play board, player1, player2
  turn = player1
  while !(board.winner? player1, player2) and !board.all_full?
    system("cls") or system("clear")
    board.display
    if turn == player1
      puts "\n\nIt is now player 1's turn (X)"
    else
      puts "\n\nIt is now player 2's turn (O)"
    end

    print "Enter a column to play\n > "
    choice = gets.chomp

    until board.add choice.to_i, turn.piece
      print "Invalid column\n > "
      choice = gets.chomp
    end

    turn = change_turn turn, player1, player2
  end

  if board.winner? player1, player2
    system("cls") or system("clear")
    board.display
    return board.winner? player1, player2
  else
    return false
  end
end

def change_turn current_turn, player1, player2
  if current_turn == player1
    return player2
  else
    return player1
  end
end

def start_menu
  system("cls") or system("clear")
  puts "Welcome to connect four\n\n"
  puts "Rules: The object of the game is to get four of your pieces\neither vertically, horizontally, or diagonally\n\n"
  puts "Please choose an option"
  puts "1. Play\n2. Quit\n\n"
end

def start
  start_menu
  print "> "
  choice = gets.chomp
  puts 

  case choice
  when "1" # Play
    board = Board.new
    player1 = Player.new "X"
    player2 = Player.new "O"

    winner = play board, player1, player2
    puts winner ? "\n\nWinner is #{winner}\n" : "\nIt is a tie!\n\n"
  when "2" # Quit
    puts "\nExiting\n"
    return
  else
    puts "\nNot a valid choice. Exiting\n"
    return
  end
end



start
