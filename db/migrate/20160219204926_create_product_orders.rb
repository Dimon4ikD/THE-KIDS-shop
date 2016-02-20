class CreateProductOrders < ActiveRecord::Migration
  def change
    create_table :product_orders do |t|
      t.references :user, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.references :line_item, index: true, foreign_key: true

      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :product, index: true, foreign_key: true
      t.belongs_to :line_item, index: true, foreign_key: true


      t.timestamps null: false
    end
    # add_foreign_key :product_orders, :users
    # add_foreign_key :product_orders, :products
    # add_foreign_key :product_orders, :line_items
  end
end
