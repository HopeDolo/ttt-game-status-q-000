# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], # top row
  [3, 4, 5], # middle row
  [6, 7, 8], # bottom row
  [0, 3, 6], # left column
  [1, 4, 7], # middle column
  [2, 5, 8], # right column
  [0, 4, 8], # left diagonal
  [2, 4, 6]  # right diagona
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|

    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X" ||
      position_1 == "O" && position_2 == "O" && position_3 == "O"
       return win_combination
    end
  end

  x = board.all? do |member|
    member.eql?(" ")
  end
  if x == true
    false
  end
end

def full?(board)
  x = board.all? do |member|
    member.eql?("X") || member.eql?("O")
  end
  if x == true
    true
  else
    false
  end
end

def draw?(board)
  if won?(board)
    false
  elsif !won?(board) && full?(board)
    true
  elsif !won?(board) && !full?(board)
    false
  end
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  win = won?(board)

  if !won?(board)
    nil
  elsif board[win[0]] == "X" && board[win[1]] == "X" && board[win[2]] == "X"
    "X"
  elsif board[win[0]] == "O" && board[win[1]] == "O" && board[win[2]] == "O"
    "O"
  end
end
