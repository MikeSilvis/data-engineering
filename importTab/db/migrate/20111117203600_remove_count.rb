class RemoveCount < ActiveRecord::Migration
  def up
  end

 def down
    remove_column :specials, :count
  end
end
