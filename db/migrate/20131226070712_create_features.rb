class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :title
      t.text :content
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
