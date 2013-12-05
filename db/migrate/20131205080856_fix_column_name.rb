class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :Requests, :user_from_id, :user_to_id
  end
end
