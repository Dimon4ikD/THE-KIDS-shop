class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.belongs_to :product, index: true, foreign_key: true
      t.decimal :price, precision: 15, scale: 2
      t.belongs_to :cart, index: true
      t.integer :quantity

      t.timestamps null: false
    end
    add_foreign_key :line_items, :carts
    # add_foreign_key :line_items, :products
  end
end
