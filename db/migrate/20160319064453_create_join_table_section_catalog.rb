class CreateJoinTableSectionCatalog < ActiveRecord::Migration
  def change
    create_join_table :sections, :catalogs do |t|
      # t.index [:section_id, :catalog_id]
      # t.index [:catalog_id, :section_id]
    end
  end
end
