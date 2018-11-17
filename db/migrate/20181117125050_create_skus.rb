class CreateSkus < ActiveRecord::Migration[5.2]
  def change
    create_table :skus do |t|
      t.string :sku
      t.integer :supplier_code
      t.string :name
      t.string :additional1
      t.string :additional2
      t.string :additional3
      t.string :additional4
      t.string :additional5
      t.float :price

      t.timestamps
    end
  end
end
