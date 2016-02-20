class CreateJoinTableCatalogCatalog < ActiveRecord::Migration
  def change
    create_join_table :catalogs, :catalogs do |t|
      # t.index [:catalog_id, :catalog_id]
      # t.index [:catalog_id, :catalog_id]
    end
  end
end
