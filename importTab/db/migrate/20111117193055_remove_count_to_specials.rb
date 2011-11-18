class RemoveCountToSpecials < ActiveRecord::Migration
  def down
    add_column :specials, :count
  end
end
