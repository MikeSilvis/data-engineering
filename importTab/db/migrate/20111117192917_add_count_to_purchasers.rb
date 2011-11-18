class AddCountToPurchasers < ActiveRecord::Migration
  def change
    add_column :purchasers, :count, :string
  end
end
