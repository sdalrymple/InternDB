class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :organization
      t.string :industry
      t.string :location
      t.string :function
      t.string :season
      t.integer :year
      t.boolean :paid
      t.integer :user_id
      t.integer :rating
      t.boolean :extended
      t.boolean :accepted
      t.string :contact
      t.boolean :approved
      t.text :review

      t.timestamps
    end
  end
end
