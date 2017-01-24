class CreateAdvertisements < ActiveRecord::Migration[5.0]
  def change
    create_table :advertisements do |t|
      t.text :title
      t.text :description
      t.text :phone
      t.float :price, precise: 2, default: 0

      t.timestamps
    end
  end
end
