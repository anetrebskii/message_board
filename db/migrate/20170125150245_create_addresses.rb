class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :advertisement_id, null: false
      t.float :lat
      t.float :lon
      t.string :formatted_address

      t.timestamps
    end

    add_foreign_key :addresses, :advertisements, delete: :cascade
    add_index :addresses, :advertisement_id
  end
end
