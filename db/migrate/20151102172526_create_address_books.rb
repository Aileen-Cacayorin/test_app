class CreateAddressBooks < ActiveRecord::Migration
  def change
    create_table :address_books do |t|
      t.column :name, :string
      t.column :user_id, :string

      t.timestamps null: false
    end
  end
end
