require 'spec_helper'

describe SectionsController do
  def valid_board_attributes
    {name: 'Test Board'}
  end

  def valid_section_attributes
    {name: 'Test Section'}
  end


  describe "GET sections_for_board" do
    it "should load the sections for a given board" do
      board = Board.create! valid_board_attributes
      section = Section.new valid_section_attributes
      section.board_id = board.id
      section.save
      get :sections_for_board, {board_id: board.to_param}
      assigns(:sections).should eq([section])
    end
  end

  describe "GET show" do
    it "should get a section for a given id" do
      section = Section.create! valid_section_attributes
      get :show, {id: section.to_param}
      assigns(:section).should eq(section)
    end
  end

  describe "POST create" do
    it "should create a new section within a board" do
      board = Board.create! valid_board_attributes
      params = {name: 'Newly Created', board_id: board.id}
      post :create, params
      assigns(:section).should_not be_nil
      assigns(:section).name.should == params[:name]
    end
  end
end
