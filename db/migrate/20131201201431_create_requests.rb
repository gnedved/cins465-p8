class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :wish_list_id
      t.integer :user_id
      t.integer :user_from_id
      t.string :status

      t.timestamps
    end
  end
end
