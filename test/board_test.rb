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
    @board.set_square "a1", :rook
    assert @board.get_square("a1") == :rook, "a1 is not ROOK"
  end

  def test_board_validates_square_ids
    assert @board.is_valid_square_id?("a1") == true, "a1 is a valid square id but it was rejected"
    assert @board.is_valid_square_id?("a9") == false, "a9 is a not valid square id but it was accepted"
    assert @board.is_valid_square_id?("a10") == false, "a10 is a not valid square id but it was accepted"

    assert @board.is_valid_square_id?("h1") == true, "h1 is a valid square id but it was rejected"
    assert @board.is_valid_square_id?("a10") == false, "a10 is a not valid square id but it was accepted"    

    assert @board.is_valid_square_id?("j1") == false, "j1 is a not valid square id but it was accepted"
  end

=begin
  def test_board_establish_initial_setup
    @board.initial_setup
    assert @board.get_square("a1")
=end


end


class Board

  def initialize
    @squares = Hash.new
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
