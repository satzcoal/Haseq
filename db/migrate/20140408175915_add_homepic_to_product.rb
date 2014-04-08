class AddHomepicToProduct < ActiveRecord::Migration
  def up
    add_column :products, :homepic, :string
  end
  def down
    remove_column :products, :homepic
  end
end
