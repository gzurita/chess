require 'minitest/autorun'
require_relative 'test_helper'
require './board'

class BoardTest < Minitest::Test

  def setup
    @board = Board.new
  end

  def test_board_exist
    assert @board.get_square("a1") == :empty, "a1 is not empty"
    assert @board.get_square("h8") == :empty, "h8 is not empty"
  end


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

    assert @board.get_square("a8") == [:rook, :black], "a8 is not rook black"
    assert @board.get_square("b8") == [:knight, :black], "b8 is not knight black"
    assert @board.get_square("c8") == [:bishop, :black], "c8 is not bishop black"
    assert @board.get_square("d8") == [:king, :black], "d8 is not king black"
    assert @board.get_square("e8") == [:queen, :black], "e8 is not queen black"
    assert @board.get_square("f8") == [:bishop, :black], "f8 is not bishop black"
    assert @board.get_square("g8") == [:knight, :black], "g8 is not knight black"
    assert @board.get_square("h8") == [:rook, :black], "h8 is not rook black"

    ["a7", "b7", "c7", "d7", "e7", "f7", "g7", "h7"].each do |square|
      assert @board.get_square(square) == [:pawn, :black], "#{square} is not pawn black"

    end

  end

  def test_move_pawn
    @board.initial_setup
    @board.move_piece "a2", "a3"
    assert @board.get_square("a2") == :empty, "a2 is not empty"
    assert @board.get_square("a3") == [:pawn, :white], "a3 is not pawn white"
  end


end