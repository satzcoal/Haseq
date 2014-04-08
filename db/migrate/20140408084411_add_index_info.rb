class AddIndexInfo < ActiveRecord::Migration
  def up
    add_column :products, :isshowindex, :boolean
    add_column :tnews, :isshowindex, :boolean
  end

  def down
    remove_column :products, :isshowindex
    remove_column :tnews, :isshowindex
  end
end
