class PostingsController < ApplicationController
  attr_accessor :posting, :postings, :headings
  respond_to :json

  def headings_for_section
    self.headings = Posting.all(conditions: {section_id: params[:section_id], is_heading: true}, order: 'created_at ASC')
    respond_with(self.headings)
  end
end
