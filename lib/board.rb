class Board
  attr_accessor :arr
  
  def initialize arr=false
    @arr = arr ? arr : Array.new(7) { Array.new(6) }
  end

  def add column, player_piece
    #validate entry
    if column < 0 or column > 6 or full? @arr[column]
      return false
    end

    top = find_top @arr[column]
    @arr[column][top] = player_piece

    true
  end

  def display
    arr = @arr
    arr.each_with_index do |column,index|
      arr[index] = column.reverse
    end

    (0..arr[0].size-1).each do |row|
      (0..arr.size-1).each do |column|
        print "|#{arr[column][row].nil? ? " " : arr[column][row]}|"
      end
      puts
    end
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
