class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      # t.has_many :catalog, index: true, foreign_key: true
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
