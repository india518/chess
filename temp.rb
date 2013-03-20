VECTORS =
 [[-2, -1],
  [-2,  1],
  [-1, -2],
  [-1,  2],
  [ 1, -2],
  [ 1,  2],
  [ 2, -1],
  [ 2,  1]]



def path_to(to_row, to_col)
  # example to_row, to_col 2,2
  from_row = 3
  from_col = 3
  move_path = []
  direction = []

  VECTORS.each do |vector|
    proj = [vector[0] + from_row, vector[1] + from_col]
    if proj == [to_row,to_col]
      direction = vector
      return [[from_row, from_col],[to_row, to_col]]
    end
  end
  false
end