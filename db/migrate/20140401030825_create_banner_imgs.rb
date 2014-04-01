class CreateBannerImgs < ActiveRecord::Migration
  def change
    create_table :banner_imgs do |t|
      t.integer :index
      t.binary :content
      t.string :path

      t.timestamps
    end
  end
end
