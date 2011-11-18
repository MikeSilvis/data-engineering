class RemoveCountFromSpecials < ActiveRecord::Migration
  def up
    remove_column :specials, :count
  end

  def down
    add_column :specials, :count, :integer
  end
end
