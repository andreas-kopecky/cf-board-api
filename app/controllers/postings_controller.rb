class PostingsController < ApplicationController
  attr_accessor :posting, :postings, :headings, :heading
  respond_to :json

  def headings_for_section
    self.headings = Posting.all(conditions: {section_id: params[:section_id], is_heading: true}, order: 'created_at ASC')
    respond_with(self.headings)
  end

  def create_heading
    raise 'No valid section_id submitted' unless Section.find params[:section_id]
    self.heading = Posting.create!(
      title: params[:title], message: params[:message], user_id: params[:user_id],
      section_id: params[:section_id], is_heading: true)
    respond_with(self.heading)
  end
end
