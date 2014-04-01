class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :product_id
      t.integer :index
      t.binary :content
      t.string :path

      t.timestamps
    end
  end
end
