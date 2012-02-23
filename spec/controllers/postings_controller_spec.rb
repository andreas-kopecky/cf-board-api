require 'spec_helper'

describe PostingsController do

  def valid_section_attributes
    {name: 'Test Section'}
  end

  def valid_heading_attributes
    [
      {title: 'Heading 1', message: 'Message 1', user_id: 1, is_heading: true},
      {title: 'Heading 1', message: 'Message 1', user_id: 1, is_heading: true},
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
end
