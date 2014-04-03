class CreateAdminTnews < ActiveRecord::Migration
  def change
    create_table :admin_tnews do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
