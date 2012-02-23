require 'spec_helper'

describe "boards/show" do
  before(:each) do
    @board = assign(:board, stub_model(Board))
  end

  it "renders attributes in <p>" do
    render
  end
end
