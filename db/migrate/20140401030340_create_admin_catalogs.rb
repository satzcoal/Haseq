class CreateCatalogs < ActiveRecord::Migration
  def change
    create_table :admin_catalogs do |t|
      t.string :name
      t.integer :index

      t.timestamps
    end
  end
end
