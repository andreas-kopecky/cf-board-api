require 'spec_helper'

describe "boards/index" do
  before(:each) do
    assign(:boards, [
      stub_model(Board),
      stub_model(Board)
    ])
  end

  it "renders a list of boards" do
    render
  end
end
