class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :amount
      t.attachment :cover
      t.integer :price
      t.references :catalog, index: true


      t.timestamps null: false
    end
  end
end
