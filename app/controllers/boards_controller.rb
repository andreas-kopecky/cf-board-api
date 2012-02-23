class BoardsController < ApplicationController
  respond_to :json
  attr_accessor :boards, :board

  def index
    self.boards = Board.all
    respond_with(self.boards)
  end

  def show
    self.board = Board.find(params[:id])
    respond_with(self.board)
  end
end
