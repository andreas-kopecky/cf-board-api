class CreatePostings < ActiveRecord::Migration
  def change
    create_table :postings do |t|
      t.string(:title, null: false)
      t.string(:message, null: false)
      t.string(:format, null: false, default: 'bbcode')
      t.integer(:user_id, null: false)
      t.integer(:section_id, null: false)
      t.integer(:heading_id)
      t.boolean(:is_heading, null: false, default: false)
      t.timestamps
    end
  end
end
