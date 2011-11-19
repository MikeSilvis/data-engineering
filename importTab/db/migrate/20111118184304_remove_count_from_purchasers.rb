class RemoveCountFromPurchasers < ActiveRecord::Migration
  def up
    remove_column :purchasers, :count
  end

  def down
    add_column :purchasers, :count, :integer
  end
end
