class SectionsController < ApplicationController
  attr_accessor :section, :sections
  respond_to :json

  def show
    self.section = Section.find params[:id]
    respond_with(self.section)
  end

  def sections_for_board
    self.sections = Section.all conditions: {board_id: params[:board_id]}
    respond_with(self.sections)
  end

  def create
    raise 'No valid board_id submitted' unless Board.find params[:board_id]
    self.section = Section.create!(name: params[:name], board_id: params[:board_id])
    respond_with(self.section)
  end
end
