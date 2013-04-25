class AddDetailsToExperiences < ActiveRecord::Migration
  def change
    add_column :experiences, :hands_on_review, :text
    add_column :experiences, :hands_on_rating, :integer
    add_column :experiences, :network_review, :text
    add_column :experiences, :network_rating, :integer
    add_column :experiences, :exposure_review, :text
    add_column :experiences, :exposure_rating, :integer
    add_column :experiences, :contact_relation, :string
    add_column :experiences, :comments, :text
  end
end
