class AddDeniedToExperiences < ActiveRecord::Migration
  def change
    add_column :experiences, :denied, :boolean
  end
end
