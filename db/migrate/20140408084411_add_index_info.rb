class AddIndexInfo < ActiveRecord::Migration
  def up
    add_column :products, :boolean, :isshowindex
    add_column :tnews, :boolean, :isshowindex
  end

  def down
    remove_column :products, :isshowindex
    remove_column :tnews, :isshowindex
  end
end
