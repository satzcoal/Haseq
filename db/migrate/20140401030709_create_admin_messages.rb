class CreateMessages < ActiveRecord::Migration
  def change
    create_table :admin_messages do |t|
      t.string :name
      t.string :email
      t.text :msg

      t.timestamps
    end
  end
end
