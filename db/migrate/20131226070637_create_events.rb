class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :creator_id
      t.string :title
      t.text :content
      t.integer :status, null: false, default: 0

      t.timestamps
    end

    add_index :events, :creator_id
  end
end
