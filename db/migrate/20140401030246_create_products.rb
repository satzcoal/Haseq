class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :catalog_id
      t.string :shortdesc
      t.text :desc
      t.text :introduce

      t.timestamps
    end
  end
end
