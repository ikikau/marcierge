class CreateCreators < ActiveRecord::Migration
  def change
    create_table :creators do |t|
      t.integer :avatar_id
      t.string :name
      t.text :profile

      t.timestamps
    end
  end
end
