class Addimagetypecol < ActiveRecord::Migration
  def up
    add_column :images, :imagetype, :string
  end

  def down
    remove_column :images, :imagetype
  end
end
