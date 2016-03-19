class CreateCatalogs < ActiveRecord::Migration
  def change
    create_table :catalogs do |t|
      # t.has_and_belongs_to_many :section, index: true, foreign_key: true
      t.string :name
      t.string :HyTML
      t.text :description
      # t.references :section, index: true

      t.timestamps null: false
    end
  end
end
