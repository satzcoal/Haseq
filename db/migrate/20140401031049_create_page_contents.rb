class CreatePageContents < ActiveRecord::Migration
  def change
    create_table :page_contents do |t|
      t.integer :index
      t.string :title
      t.text :content
      t.integer :image_id

      t.timestamps
    end
  end
end
