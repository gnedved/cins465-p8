class CreateWishLists < ActiveRecord::Migration
  def change
    create_table :wish_lists do |t|
      t.string :name
      t.boolean :privacy
      t.integer :user_id

      t.timestamps
    end
  end
end
