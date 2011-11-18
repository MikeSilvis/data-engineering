class AddCountToSpecials < ActiveRecord::Migration
  def change
    add_column :specials, :count, :integer
  end
end
