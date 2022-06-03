# Module responsible for the good execution of a game
# and respect of the rules

# We'll consider a board game composed of 12 rows and 12 cols,
# (because for a user to win, he must have 6 cards of it's color aligned (in any direction)).

# All intersections between cols and rows are called Cells
# Each cells has coordinates [x,y]:
#  - x is the index (0 based) of the cell in its row
#  - y is the index (0 based) of the cell in its col

# We'll consider that the first move of the game places the user's card
# at the very center of the board (so [5,5])
module GameMaster
  def self.has_any_adjacent?(coords_a, coords_list = [])
    coords_list.any? { |coords_b| GameMaster.are_adjacents?(coords_a, coords_b) }
  end

  # For a user to be allowed to make a move, his card must be placed
  # at adjacents coordinates of any other card
  def self.are_adjacents?(coords_a, coords_b)
    x1, y1 = coords_a
    x2, y2 = coords_b

    return true if coords_a == coords_b
    return true if (y2 == y1 || y2 == (y1 + 1) || y2 == (y1 - 1)) && (x2 == x1 || x2 == (x1 + 1) || x2 == (x1 - 1))

    false
  end
end