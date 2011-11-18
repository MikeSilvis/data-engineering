class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.text :file

      t.timestamps
    end
  end
end
