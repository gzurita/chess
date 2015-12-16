require 'minitest/autorun'
require_relative 'test_helper'

class BoardTest < Minitest::Test

  def setup
    @board = Board.new
  end

  def test_board_exist
    assert @board.get_square("a1") == :empty, "a1 is not empty"
    assert @board.get_square("h8") == :empty, "h8 is not empty"
  end

# TODO: add color to pieces

  def test_board_saves_pieces
    @board.set_square "a1", [:rook, :white]
    assert @board.get_square("a1") == [:rook, :white], "a1 is not ROOK white"
  end



  def test_board_validates_square_ids
    assert @board.is_valid_square_id?("a1") == true, "a1 is a valid square id but it was rejected"
    assert @board.is_valid_square_id?("a9") == false, "a9 is a not valid square id but it was accepted"
    assert @board.is_valid_square_id?("a10") == false, "a10 is a not valid square id but it was accepted"

    assert @board.is_valid_square_id?("h1") == true, "h1 is a valid square id but it was rejected"
    assert @board.is_valid_square_id?("a10") == false, "a10 is a not valid square id but it was accepted"    

    assert @board.is_valid_square_id?("j1") == false, "j1 is a not valid square id but it was accepted"
  end

  def test_board_establish_initial_setup
    @board.initial_setup
    assert @board.get_square("a1") == [:rook, :white], "a1 is not rook white"
    assert @board.get_square("b1") == [:knight, :white], "b1 is not knight white"
    assert @board.get_square("c1") == [:bishop, :white], "c1 is not bishop white"
    assert @board.get_square("d1") == [:king, :white], "d1 is not king white"
    assert @board.get_square("e1") == [:queen, :white], "e1 is not queen white"
    assert @board.get_square("f1") == [:bishop, :white], "f1 is not bishop white"
    assert @board.get_square("g1") == [:knight, :white], "g1 is not knight white"
    assert @board.get_square("h1") == [:rook, :white], "h1 is not rook white"

    ["a2", "b2", "c2", "d2", "e2", "f2", "g2", "h2"].each do |square|
      assert @board.get_square(square) == [:pawn, :white], "#{square} is not pawn white"
    end

  end


end


class Board

  def initialize
    @squares = Hash.new
  end

  def initial_setup
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

end
