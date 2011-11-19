class AddCountToSpecials < ActiveRecord::Migration
  def change
    add_column :specials, :count, :integer
  end
  def down
    remove_column :purchaser, :count
  end
end
