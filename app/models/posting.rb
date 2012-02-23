class Posting < ActiveRecord::Base
  belongs_to :section

  has_one :heading, class_name: :posting
  has_many :followups, class_name: :posting, foreign_key: :heading_id, order: 'created_at ASC'
end
