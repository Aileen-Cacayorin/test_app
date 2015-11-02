class ChangeColumnType < ActiveRecord::Migration
  def change
    change_column :address_books, :user_id, 'integer USING CAST(user_id AS integer)'
  end
end
