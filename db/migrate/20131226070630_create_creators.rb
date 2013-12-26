class CreateCreators < ActiveRecord::Migration
  def change
    create_table :creators do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.text :profile
      t.integer :avator_id
      t.timestamps
    end
  end
end
