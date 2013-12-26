class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.string :title
      t.text :content
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
