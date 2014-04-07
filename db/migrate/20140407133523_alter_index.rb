class AlterIndex < ActiveRecord::Migration
  def up
    rename_column :catalogs, :index, :nindex
    rename_column :images, :index, :nindex
    rename_column :banner_imgs, :index, :nindex
    rename_column :page_contents, :index, :nindex
  end

  def down
    rename_column :catalogs, :nindex, :index
    rename_column :images, :nindex, :index
    rename_column :banner_imgs, :nindex, :index
    rename_column :page_contents, :nindex, :index
  end
end
