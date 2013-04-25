class AddMoreToExperience < ActiveRecord::Migration
  def change
    add_column :experiences, :city, :string
    add_column :experiences, :state, :string
    add_column :experiences, :country, :string
    add_column :experiences, :repeat, :boolean
  end
end
