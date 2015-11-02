class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.column :firstName, :string
      t.column :lastName, :string
      t.column :address_book_id, :integer
      t.column :number, :string

      t.timestamps null: false
    end
  end
end
