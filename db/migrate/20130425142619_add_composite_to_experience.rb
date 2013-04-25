class AddCompositeToExperience < ActiveRecord::Migration
  def change
    add_column :experiences, :composite, :float
  end
end
