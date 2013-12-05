class CreateValidAccesses < ActiveRecord::Migration
  def change
    create_table :valid_accesses do |t|
      t.integer :wish_list_id
      t.integer :user_id

      t.timestamps
    end
  end
end
