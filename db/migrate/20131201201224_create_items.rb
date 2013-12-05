class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :image
      t.string :url
      t.integer :wish_list_id

      t.timestamps
    end
  end
end
