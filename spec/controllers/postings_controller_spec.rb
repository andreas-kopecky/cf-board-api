require 'spec_helper'

describe PostingsController do

  def valid_section_attributes
    {name: 'Test Section'}
  end

  def valid_heading_attributes
    [
      {title: 'Heading 1', message: 'Message 1', user_id: 1, is_heading: true},
      {title: 'Heading 2', message: 'Message 2', user_id: 1, is_heading: true},
    ]
  end

  describe "GET headings_for_section" do
    it "should return all headings for a given section" do
      section = Section.create! valid_section_attributes
      headings = []
      valid_heading_attributes.each do |attributes|
        attributes[:section_id] = section.id
        headings << Posting.create!(attributes)
      end
      get :headings_for_section, {section_id: section.to_param}
      assigns(:headings).should eq(headings)
    end
  end

  describe "POST create_heading" do
    it "should create a new section within a board" do
      section = Section.create! valid_section_attributes
      params = {title: 'Newly Created', message: 'New Messages', user_id: 1, section_id: section.id}
      post :create_heading, params
      assigns(:heading).should_not be_nil
      assigns(:heading).title.should == params[:title]
      assigns(:heading).message.should == params[:message]
    end
  end

end
