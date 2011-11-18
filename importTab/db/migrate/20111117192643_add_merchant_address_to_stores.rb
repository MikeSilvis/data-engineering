class AddMerchantAddressToStores < ActiveRecord::Migration
  def change
    add_column :stores, :merchant_stores, :string
  end
end
