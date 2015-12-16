class Board

  def initialize
    @squares = Hash.new
  end

  def initial_setup

    # setup white
    @squares["a1"] = [:rook, :white]
    @squares["b1"] = [:knight, :white]
    @squares["c1"] = [:bishop, :white]
    @squares["d1"] = [:king, :white]
    @squares["e1"] = [:queen, :white]
    @squares["f1"] = [:bishop, :white]
    @squares["g1"] = [:knight, :white]
    @squares["h1"] = [:rook, :white]

    ["a2", "b2", "c2", "d2", "e2", "f2", "g2", "h2"].each do |square|
      @squares[square] = [:pawn, :white]
    end

    # setup black
    @squares["a8"] = [:rook, :black]
    @squares["b8"] = [:knight, :black]
    @squares["c8"] = [:bishop, :black]
    @squares["d8"] = [:king, :black]
    @squares["e8"] = [:queen, :black]
    @squares["f8"] = [:bishop, :black]
    @squares["g8"] = [:knight, :black]
    @squares["h8"] = [:rook, :black]

    ["a7", "b7", "c7", "d7", "e7", "f7", "g7", "h7"].each do |square|
      @squares[square] = [:pawn, :black]
    end
  end

  def get_square square_id
    @squares.has_key?(square_id) ? @squares[square_id] : :empty 
  end

  def set_square square_id, piece
    @squares[square_id] = piece
  end

  def is_valid_square_id? square_id
    if square_id.length != 2
      return false
    else
      rows = ["a", "b", "c", "d", "e", "f", "g", "h"]
      cols = ["1", "2", "3", "4", "5", "6", "7", "8"]
      return (rows.include?(square_id[0]) && cols.include?(square_id[1]))
    end
  end

  def move_piece origin, destiny
    @squares[destiny] = @squares[origin]
    @squares[origin] = :empty
  end

end
