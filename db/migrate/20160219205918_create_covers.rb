class CreateCovers < ActiveRecord::Migration
  def change
    create_table :covers do |t|
      t.string :name
      t.attachment :image
      t.text :description

      t.timestamps null: false
    end
  end
end
