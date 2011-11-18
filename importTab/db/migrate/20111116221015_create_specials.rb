class CreateSpecials < ActiveRecord::Migration
  def change
    create_table :specials do |t|
      t.text :description
      t.integer :price
      t.integer :purchaser_id
      t.integer :store_id
      t.integer :count

      t.timestamps
    end
  end
end
