class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :amount
      t.attachment :cover
      t.integer :price
      t.text :description
      t.references :catalog, index: true, foreign_key: true

      t.belongs_to :catalog, index: true, foreign_key: true


      t.timestamps null: false
    end
  end
end
