class CreateTnews < ActiveRecord::Migration
  def change
    create_table :tnews do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
